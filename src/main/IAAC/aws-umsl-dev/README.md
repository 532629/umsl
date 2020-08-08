# # Terraform Script for AWS resources


# vpc module(umsl/main.tf)
-------------------------------------
Create vpc and push the state file to S3 bucket and put a lock using Dynamodb.


# ec2-module (ec2-module/main.tf and vriables.tf) 
-----------------------------------
Defile following resources 
	aws_autoscaling_group -->aws_launch_configuration-->aws_security_group


# Environment creation - Dev-Ec2/main.tf
---------------------------------------
Create the EC2 instances with desired configuration

cluster_name = "webserver-dev"
image_id = "ami-035b3c7efe6d061d5"
max_size = 2
min_size = 1
desired_capacity = 1
instance_type = "t2.micro"
key_name = "umsl-bastion-key"
associate_public_ip_address = "true"
umsl_public_subnet = 
Cluster-Name :  webserver-dev
     

