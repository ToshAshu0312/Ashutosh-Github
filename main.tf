terraform {
  
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = " ~>5.0 "
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-076e3a557efe1aa9c"
  instance_type = var.instance_type
  key_name = "terraform-key"
  vpc_security_group_ids = [aws_security_group.demo.id]

  tags = {
    name = "Sample"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/ashut/Desktop/Terraform-learning/New_terraform/terraform-key.pem")
    host        = aws_instance.myec2.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
}


output "IP" {
  value = aws_instance.myec2.public_ip
}



output "ID" {
  value = aws_instance.myec2.id
}

output "TEXT_FILE" {
  value = file("./sample1.txt")
}

