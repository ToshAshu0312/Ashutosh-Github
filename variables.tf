variable "instance_type" {
  default = "t2.micro"
}

variable "ports" {
  type = list(any)
}
