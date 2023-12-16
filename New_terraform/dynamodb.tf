resource "aws_dynamodb_table" "mydynamodbtable" {
  name = "firstdbtable"
  hash_key = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}