resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.latest.id
  instance_type          = var.instance_type
  availability_zone = "ap-south-1b"

  #tags = {
   # Name = "myfirstec2"
  #}

  tags = local.common_tags
}

locals {
  common_tags = {
      Name = var.name
      environment = var.env
  }
}