variable "type" {
  type    = list(any)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

variable "region" {
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-east-2  = "t2.small"
    ap-south-1 = "t2.medium"
  }
}

variable "ports" {
  type    = list(any)
}
