resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "myfirstbucket"
    environment = "dev"
  }
}