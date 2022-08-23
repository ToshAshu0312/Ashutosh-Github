terraform {
    required_providers {
       aws = {
        
          source = "hashicorp/aws"
          version = " ~>4.0 "
        }
    }
}

provider "aws" {
    region  = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami= "ami-0cea098ed2ac54925"
    instance_type= var.instance_type

     tags = {
        name = "Sample"
    }

connection{
    type = "ssh"
    user= "ec2-user"
    password = var.root_password
    host = self.public_ip
}

provisioner "remote-exec" {
    inline = [
        "sudo amazon-linux-extras install -y nginx1" ,
        "sudo systemctl start nginx"
    ]
}
}

resource "aws_security_group" "sg" {
  name= "terraform_security_group"
}

output "IP" {
    value = aws_instance.myec2.public_ip
}



output "ID" {
    value = aws_instance.myec2.id
}

output "TEXT_FILE" {
  value = file("${path.module}/sample1.txt")
}

