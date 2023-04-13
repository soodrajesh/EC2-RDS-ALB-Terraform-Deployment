[ec2-user@ip-172-31-28-60 tmp]$ terraform plan
data.aws_vpc.default: Reading...
data.aws_vpc.default: Read complete after 0s [id=vpc-0bd5ca5c81]
data.aws_subnet_ids.subnets: Reading...
data.aws_subnet_ids.subnets: Read complete after 1s [id=vpc-0bd5ca5c81]
data.aws_subnet.subnets["subnet-049ac40c7fa73e6"]: Reading...
data.aws_subnet.subnets["subnet-058913b23d9c72e"]: Reading...
data.aws_subnet.subnets["subnet-092317f239795c6"]: Reading...
data.aws_subnet.subnets["subnet-0b05e8e772705b1"]: Reading...
data.aws_subnet.subnets["subnet-0b05e8e772705b1"]: Read complete after 0s [id=subnet-0b05e8e772705b1]
data.aws_subnet.subnets["subnet-049ac40c7fa73e6"]: Read complete after 0s [id=subnet-049ac40c7fa73e6]
data.aws_subnet.subnets["subnet-058913b23d9c72e"]: Read complete after 0s [id=subnet-058913b23d9c72e]
data.aws_subnet.subnets["subnet-092317f239795c6"]: Read complete after 0s [id=subnet-092317f239795c6]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_db_instance.rds will be created
  + resource "aws_db_instance" "rds" {
      + address                               = (known after apply)
      + allocated_storage                     = 10
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = (known after apply)
      + db_subnet_group_name                  = "rds-subnet-group"
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "sqlserver-se"
      + engine_version                        = "15.00.4236.7.v1"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = (known after apply)
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t3.medium"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = false
      + name                                  = "my-rds-instance"
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = "default.sqlserver-se-15.0"
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = false
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags                                  = {
          + "Name" = "rds-instance"
        }
      + tags_all                              = {
          + "Name" = "rds-instance"
        }
      + timezone                              = (known after apply)
      + username                              = "DBAdmin"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_db_subnet_group.rds will be created
  + resource "aws_db_subnet_group" "rds" {
      + arn                     = (known after apply)
      + description             = "Subnet group for RDS instance"
      + id                      = (known after apply)
      + name                    = "rds-subnet-group"
      + name_prefix             = (known after apply)
      + subnet_ids              = [
          + "subnet-0123456789",
          + "subnet-0123456789",
        ]
      + supported_network_types = (known after apply)
      + tags_all                = (known after apply)
    }

  # aws_instance.webserver[0] will be created
  + resource "aws_instance" "webserver" {
      + ami                                  = "ami-0c252bb9e6b71848e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.medium"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "dev-webserver-1"
        }
      + tags_all                             = {
          + "Name" = "dev-webserver-1"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + ebs_block_device {
          + delete_on_termination = true
          + device_name           = "/dev/sda1"
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = {
              + "Name" = "dev-webserver"
            }
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 50
          + volume_type           = "gp3"
        }
    }

  # aws_instance.webserver[1] will be created
  + resource "aws_instance" "webserver" {
      + ami                                  = "ami-0c252bb9e6b71848e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.medium"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "dev-webserver-2"
        }
      + tags_all                             = {
          + "Name" = "dev-webserver-2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + ebs_block_device {
          + delete_on_termination = true
          + device_name           = "/dev/sda1"
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = {
              + "Name" = "dev-webserver"
            }
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 50
          + volume_type           = "gp3"
        }
    }

  # aws_lb.awsalb will be created
  + resource "aws_lb" "awsalb" {
      + arn                                         = (known after apply)
      + arn_suffix                                  = (known after apply)
      + desync_mitigation_mode                      = "defensive"
      + dns_name                                    = (known after apply)
      + drop_invalid_header_fields                  = false
      + enable_deletion_protection                  = false
      + enable_http2                                = true
      + enable_tls_version_and_cipher_suite_headers = false
      + enable_waf_fail_open                        = false
      + enable_xff_client_port                      = false
      + id                                          = (known after apply)
      + idle_timeout                                = 60
      + internal                                    = false
      + ip_address_type                             = (known after apply)
      + load_balancer_type                          = "application"
      + name                                        = "MyALB"
      + preserve_host_header                        = false
      + security_groups                             = (known after apply)
      + subnets                                     = [
          + "subnet-049ac40c7fa73e6",
          + "subnet-058913b23d9c72e",
          + "subnet-092317f239795c6",
          + "subnet-0b05e8e772705b1",
        ]
      + tags                                        = {
          + "Name" = "MyALB"
        }
      + tags_all                                    = {
          + "Name" = "MyALB"
        }
      + vpc_id                                      = (known after apply)
      + xff_header_processing_mode                  = "append"
      + zone_id                                     = (known after apply)
    }

  # aws_lb_listener.http will be created
  + resource "aws_lb_listener" "http" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 443
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_target_group.mytg will be created
  + resource "aws_lb_target_group" "mytg" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = false
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "mytg"
      + port                               = 443
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = "vpc-0bd5ca5c81f3fb1"

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = (known after apply)
          + unhealthy_threshold = 3
        }
    }

  # aws_route53_record.app_lb_dns_record will be created
  + resource "aws_route53_record" "app_lb_dns_record" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = "app-lb"
      + records         = (known after apply)
      + ttl             = 300
      + type            = "CNAME"
      + zone_id         = "Z123456789"
    }

  # aws_route53_record.app_private_ip_record[0] will be created
  + resource "aws_route53_record" "app_private_ip_record" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = "app-private"
      + records         = (known after apply)
      + ttl             = 300
      + type            = "A"
      + zone_id         = "Z123456789"
    }

  # aws_route53_record.app_private_ip_record[1] will be created
  + resource "aws_route53_record" "app_private_ip_record" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = "app-private"
      + records         = (known after apply)
      + ttl             = 300
      + type            = "A"
      + zone_id         = "Z123456789"
    }

  # aws_security_group.lb will be created
  + resource "aws_security_group" "lb" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow All Outbound Traffic"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "HTTP"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "Dev Load Balancer"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "Dev Load Balancer"
        }
      + tags_all               = {
          + "Name" = "Dev Load Balancer"
        }
      + vpc_id                 = "vpc-0bd5ca5c81f3fb195"
    }

  # aws_security_group.rds will be created
  + resource "aws_security_group" "rds" {
      + arn                    = (known after apply)
      + description            = "Security group for RDS instance"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + description      = ""
              + from_port        = 1433
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 1433
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = "rds"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "rds-security-group"
        }
      + tags_all               = {
          + "Name" = "rds-security-group"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.webserver will be created
  + resource "aws_security_group" "webserver" {
      + arn                    = (known after apply)
      + description            = "Works Internal"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow All Outbound Traffic"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow internal access from Dev Servers"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
        ]
      + name                   = "dev-webserver Security Group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "dev-webserver Security Group"
        }
      + tags_all               = {
          + "Name" = "dev-webserver Security Group"
        }
      + vpc_id                 = "vpc-0bd5ca5c81f3fb1"
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id         = [
      + null,
      + null,
    ]
  + lb_dns_name         = (known after apply)
  + private_ip          = [
      + null,
      + null,
    ]
  + rds_database_name   = "my-rds-instance"
  + rds_endpoint        = (known after apply)
  + rds_master_username = "DBAdmin"
  + rds_port            = (known after apply)
╷
│ Warning: Deprecated Resource
│ 
│   with data.aws_subnet_ids.subnets,
│   on main.tf line 22, in data "aws_subnet_ids" "subnets":
│   22: data "aws_subnet_ids" "subnets" {
│ 
│ The aws_subnet_ids data source has been deprecated and will be removed in a future version. Use the aws_subnets data source instead:
│ https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets
│ 
│ (and one more similar warning elsewhere)
╵
╷
│ Warning: Argument is deprecated
│ 
│   with aws_db_instance.rds,
│   on main.tf line 209, in resource "aws_db_instance" "rds":
│  209:   name                 = "my-rds-instance"
│ 
│ Use db_name instead
│ 
│ (and one more similar warning elsewhere)
╵
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 242, in output "rds_database_name":
│  242:   value = "${aws_db_instance.rds.name}"
│ 
│ The attribute "name" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵
