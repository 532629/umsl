# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}
#variable "vpc_id" {
#  description = "VPC id "
#  default = "vpc-00c27b848d7ec5e0f"
# }

variable "image_id" {
  description = "Ec2 image id "
  type        = string
}

variable "availability_zones" {
  description = "Availability_zones for ec2 instance"
  default = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "The desired number of EC2 Instances in the ASG which should be running"
  type        = number
}


#variable "iam_instance_profile" {
 # description = "EC2 Instances Profile"
#  type        = string
#}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = false
}

variable "umsl_public_subnet" {
  description = "Public IP Address True or False"
  type        = list
}



# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "alb_port" {
  description = "The port the ELB will use for HTTP requests"
  type        = number
  default     = 80
}