terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = " ~>4.0 "
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

  tags = {
    name = "Sample"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:\ProgramData\Jenkins\.jenkins\terraform-key.pem")
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
  value = file("${path.module}/sample1.txt")
}

