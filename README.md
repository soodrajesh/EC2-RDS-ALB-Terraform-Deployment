# Terraform-Project-1
Terraform-Project-1

#Terraform Project by Rajesh Sood.
#**Description**: 
1. Public-facing EC2 Instance: This is a t3.medium sized EC2 instance that is publicly accessible on port 443. It is hosted on amazon Linux server and has 1 GP3  drive of 50GB each.


2. Application Load Balancer (ALB) and Target Group: The public-facing EC2 instance is part of a target group that is associated with an Application Load Balancer (ALB). This ALB is responsible for distributing traffic to the EC2 instances.


3. Private-facing RDS Instance: This is a t3.medium sized RDS instance running  SQL Server Standard edition. It is not accessible from the internet and only port 1433 is accessible from the public-facing EC2 instance.


4. AWS VPC: This is a Virtual Private Cloud (VPC) that contains subnets for the public-facing and private-facing instances. The VPC provides network isolation and security for the instances.


5. Route53 DNS Service: This service is used to create two DNS records: one containing the private IP address of the public-facing EC2 instance and the other containing the DNS name of the ALB. This makes it easy for users to access the application.
