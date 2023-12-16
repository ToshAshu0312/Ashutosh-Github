resource "aws_ebs_volume" "myebs" {
  availability_zone = var.az
  type              = var.type
  size              = var.size
  
}