#!/bin/sh
echo "Hello world"
sudo yum update -y 

echo "this is bastion machine $hostname" > /home/ec2-user/user_data.txt & 