output "ec2_output" {
  value = aws_instance.myec2.id
}

output "localtags" {
  value = aws_instance.myec2.tags_all
}