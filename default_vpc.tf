resource "aws_default_vpc" "default" {

}
output "vpc_id"{
    value=aws_default_vpc.default.id
}
resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
}