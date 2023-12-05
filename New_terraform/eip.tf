/* resource "aws_eip" "sample" {
    domain = "vpc"
}

resource "aws_eip_association" "attach" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.sample.id
}
*/