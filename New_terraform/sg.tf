resource "aws_security_group" "demo" {
  name        = "demo"
  description = "creating demo security group with terraform"

  /* ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    #cidr_blocks      = ["${aws_eip.sample.public_ip}/32"]
    cidr_blocks = ["0.0.0.0/0"]
 }   
*/
dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
}
