output "ec2" {
  value = aws_instance.myec2[*].id
}

output "sg" {
  value = aws_security_group.demo.id
}

output "iam" {
  value = aws_iam_user.Terraform.name
}