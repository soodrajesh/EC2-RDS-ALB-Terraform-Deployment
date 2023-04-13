variable "region" {
    type = string
    description = "Region Example: us-west-2"
    default = "us-west-2" #Update the desired region 
}

variable "instance_count" {
  type        = number
  default     = 2 #Update the number of desired EC2 instances
  description = "The number of EC2 instances to create"
}

variable "ec2_ami" {
  type        = string
  default     = "ami-0c252bb9e6b71848e" #Update the ami id
  description = "The ami for EC2 instances"
}

variable "db_private_subnet_ids" {
  description = "IDs of the subnets in the DB subnet group"
  type        = list(string)
  default = ["subnet-012345678901", "subnet-012345678902"] #Update the private subnet ids for DB
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.medium" #Update the EC2 size as per requirement 
  description = "The size of EC2 instances to create"
}

variable "ec2_volume_size" {
  type        = number
  default     = 50 #Update the EC2 volume size as per requirement 
  description = "The size of volume attached to EC2 instance"
}

variable "ec2_volume_type" {
  type        = string
  default     = "gp3"  #Update the EC2 volume type as per requirement 
  description = "The type of volume attached to EC2 instance"
}

variable "route53_zone_id" {
  type        = string
  default     = "Z123456789"  #Update the zone id of route53 
  description = "The zone id of route53"
}

variable "db_username" {
  type        = string
  default     = "DBAdmin"  #Update username for RDS Instance 
  description = "The username for RDS Instance"
}

variable "db_password" {
  type        = string
  default     = "myDBpassword"  #Update username for RDS Instance 
  description = "The password for RDS Instance"
}

variable "rds_instance_class" {
  type        = string
  default     = "db.t3.medium" #Update the RDS classs as per requirement 
  description = "The class of RDS instances to create"
}

variable "rds_engine" {
  type        = string
  default     = "sqlserver-se" #Update the RDS engine as per requirement 
  description = "The engine of RDS instances to create"
}

variable "rds_engine_version" {
  type        = string
  default     = "15.00.4236.7.v1" #Update the RDS engine version as per requirement 
  description = "The engine version of RDS instances to create"
}