#Terraform Project by Rajesh Sood.
#Description: 
#1. Public-facing EC2 Instance: This is a t3.medium sized EC2 instance that is publicly accessible on port 443. It is hosted on amazon Linux server and has 1 GP3  drive of 50GB each.
#2. Application Load Balancer (ALB) and Target Group: The public-facing EC2 instance is part of a target group that is associated with an Application Load Balancer (ALB). This ALB is responsible for distributing traffic to the EC2 instances.
#3. Private-facing RDS Instance: This is a t3.medium sized RDS instance running  SQL Server Standard edition. It is not accessible from the internet and only port 1433 is accessible from the public-facing EC2 instance.
#4. AWS VPC: This is a Virtual Private Cloud (VPC) that contains subnets for the public-facing and private-facing instances. The VPC provides network isolation and security for the instances.
#5. Route53 DNS Service: This service is used to create two DNS records: one containing the private IP address of the public-facing EC2 instance and the other containing the DNS name of the ALB. This makes it easy for users to access the application.
#Assumptions: 
#1. We already have VPC configured with predefined public and private subnets
#2. We already have zone_id of Route53


# Set the provider as AWS
provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.subnets.ids
  id       = each.value
}


# Create an EC2 instance
resource "aws_instance" "webserver" {
  count                       = var.instance_count
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  ami                         = var.ec2_ami
  vpc_security_group_ids      = [ aws_security_group.webserver.id ]
  
  tags = {
  Name = "dev-webserver-${count.index + 1}"
  }    

  ebs_block_device {
  device_name           = "/dev/sda1"
  delete_on_termination = true
  volume_size           = var.ec2_volume_size
  volume_type           = var.ec2_volume_type
  tags = {
  Name = "dev-webserver"
    }
  }
}

# Create a security group for the ec2 instance
resource "aws_security_group" "webserver" {
  name        = "dev-webserver Security Group"
  description = "Works Internal"
  vpc_id      = data.aws_vpc.default.id

ingress {
    description     = "Allow internal access from Dev Servers"
    from_port       = 443
    to_port         = 443
    protocol        = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = []
  }

egress {
    description = "Allow All Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "dev-webserver Security Group"
  }
}

#Load balancer security group
resource "aws_security_group" "lb" {
  name        = "Dev Load Balancer"
  vpc_id      = data.aws_vpc.default.id

ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    description = "Allow All Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

  tags = {
    Name     = "Dev Load Balancer" 
  }
}

# Create an application load balancer
resource "aws_lb" "awsalb" {
  name                       = "MyALB"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb.id]
  subnets                    = data.aws_subnet_ids.subnets.ids 
  enable_deletion_protection = false

  tags = {
    Name     = "MyALB"
  }
}

# Create a target group for the ec2 instances
resource "aws_lb_target_group" "mytg" {
  name     = "mytg"
  port     = 443
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = data.aws_vpc.default.id
  health_check {
    path = "/"
  }
}

#Target group attachment 
resource "aws_lb_target_group_attachment" "tgattachment" {
  count            = length(aws_instance.webserver.*.id) == 3 ? 3 : 0
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id        = element(aws_instance.webserver.*.id, count.index)
  port             = 80
}

#Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.awsalb.arn
  port              = "443"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.mytg.arn
  }
}


# Create a Route53 record for the instance's private IP address
resource "aws_route53_record" "app_private_ip_record" {
  zone_id = var.route53_zone_id
  name    = "app-private"
  type    = "A"
  ttl     = "300"

  records = [
    aws_instance.webserver[count.index].private_ip,
  ]
  count = "${var.instance_count}"
}

# Create a Route53 record for the load balancer's DNS name
resource "aws_route53_record" "app_lb_dns_record" {
  zone_id = var.route53_zone_id
  name    = "app-lb"
  type    = "CNAME"
  ttl     = "300"

  records = [aws_lb.awsalb.dns_name]
}

# Create a private facing RDS 
resource "aws_db_subnet_group" "rds" {
  name        = "rds-subnet-group"
  description = "Subnet group for RDS instance"
  subnet_ids  = var.db_private_subnet_ids
}

#RDS security group
resource "aws_security_group" "rds" {
  name_prefix = "rds"
  description = "Security group for RDS instance"

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    security_groups = ["${aws_security_group.webserver.id}"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

#create RDS Instance
resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  name                 = "my-rds-instance"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.sqlserver-se-15.0"
  multi_az             = false

  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.rds.name}"

  tags = {
    Name = "rds-instance"
  }
}


# Output the resources
output "instance_id" {
  value = aws_instance.webserver.*.id
}

output "private_ip" {
  value = aws_instance.webserver.*.private_ip
}

output "lb_dns_name" {
  value = aws_lb.awsalb.dns_name
}

output "rds_endpoint" {
  value = "${aws_db_instance.rds.endpoint}"
}

output "rds_database_name" {
  value = "${aws_db_instance.rds.name}"
}

output "rds_port" {
  value = "${aws_db_instance.rds.port}"
}

output "rds_master_username" {
  value = "${aws_db_instance.rds.username}"
}