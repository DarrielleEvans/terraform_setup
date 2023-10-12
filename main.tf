# configure aws provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
  #profile = "Admin"
}

# create instance
resource "aws_instance" "web_server01" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    key_name = var.key_name
    user_data = "${file("deploy.sh")}"
    tags = {
        "Name" : var.instance_name
    }

}

#output the ip address of the new ec2
output "instance_ip" {
  value = aws_instance.web_server01.public_ip
}
