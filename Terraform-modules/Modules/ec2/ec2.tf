resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.latest.id
  instance_type          = var.instance_type

  tags = {
    Name = "myfirstec2"
  }
}