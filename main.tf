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
    profile = "default"
}

resource "aws_instance" "myec2" {
    ami= "ami-0a5b0c3ca9452f414"
    instance_type= var.instance_type

    tags = {
        name = "Sample"
    }
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
