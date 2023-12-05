resource "aws_instance" "myec2" {
  ami           = data.aws_ami.latest.id
  instance_type = var.type[0]
  key_name      = "Terraform-key"
  #  count                  = 1
  vpc_security_group_ids = [aws_security_group.demo.id]
  #   tags =  {
  #   Name = "MyfirstEC2.${count.index]"
  #   }  
  tags = local.common_tags

  lifecycle {
    ignore_changes        = [tags]
    create_before_destroy = false
    prevent_destroy       = false
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/ashut/Desktop/Terraform-learning/New_terraform/Terraform-key.pem")
    host        = aws_instance.myec2.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }

}

locals {
  common_tags = {
    Name  = "MYEC2"
    Owner = "ASHUTOSH"
    PC    = "ASUS"
  }
}

