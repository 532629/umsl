provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}
module ec2-module {

source = "../ec2-module"

cluster_name = "webserver-dev"

image_id = "ami-035b3c7efe6d061d5"
max_size = 2
min_size = 1
desired_capacity = 1
instance_type = "t2.micro"
key_name = "umsl-bastion-key"
associate_public_ip_address = "true"
umsl_public_subnet = ["subnet-0c107758c42f77f50", "subnet-0de878c95807bdd52"]

}