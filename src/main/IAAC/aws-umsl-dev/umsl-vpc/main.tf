provider "aws" {
  region = "us-east-1"
   version = "~> 2.20"
}

module "vpc" {
  #source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=master"
   source = "terraform-aws-modules/vpc/aws" 
   name = "umsl-Dev-VPC"

  cidr = "10.16.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.16.1.0/24", "10.16.2.0/24"]
  public_subnets      = ["10.16.11.0/24", "10.16.12.0/24"]
  database_subnets    = ["10.16.21.0/24", "10.16.22.0/24"]


  create_database_subnet_group = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = true

 # enable_s3_endpoint       = true
 # enable_dynamodb_endpoint = true

  enable_dhcp_options              = false
  dhcp_options_domain_name         = "service.consul"
  dhcp_options_domain_name_servers = ["127.0.0.1", "10.16.0.2"]

  tags = {
    Owner       = "umsl"
    Environment = "development"
    Name        = "vpc-umsl"
  }
}

#### S3 backend with Dynamodb lock ##

## DyanamoDB for statelock ##

resource "aws_dynamodb_table" "dynamodb-tf-umsl-state-lock" {
  name = "tf-state-umsl-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
      "Name"      = "tf-state-umsl-lock-dynamo"
      "Environment" = "Dev"
    }
}

## Backend configuration ## 

terraform {
backend "s3" {
bucket="umsl-s3-terraform"
key="terraform-dev/vpc_umsl.tfstate"
#dynamodb_table = "terraform-state-umsl-lock-dynamo"
encrypt = true # Optional, S3 Bucket Server Side Encryption
region="us-east-1"
}
}
