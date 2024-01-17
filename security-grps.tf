

# resource "aws_default_security_group" "default" {
#   vpc_id = aws_default_vpc.default.id
#   ingress {
#     protocol  = -1
#     self      = true
#     from_port = 0
#     to_port   = 0
#   }
# }
resource "aws_security_group" "alb" {
  name        = "alb sg "
  description = "Allow alb traffic"
  vpc_id      = aws_default_vpc.default.id
  depends_on = [ aws_default_vpc.default ]

 
}

resource "aws_vpc_security_group_ingress_rule" "alb_in" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
  depends_on = [ aws_security_group.alb ]
}

resource "aws_vpc_security_group_egress_rule" "alb_out" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
  depends_on = [ aws_security_group.alb ]
}


resource "aws_security_group" "db_sg" {
  name        = "db sg "
  description = "Allow db traffic"
  vpc_id      = aws_default_vpc.default.id
  depends_on = [ aws_default_vpc.default ]


}

resource "aws_vpc_security_group_ingress_rule" "db_sg_in" {
  security_group_id = aws_security_group.db_sg.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
  depends_on = [ aws_security_group.db_sg ]
}

resource "aws_vpc_security_group_egress_rule" "db_sg_out" {
  security_group_id = aws_security_group.db_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
  depends_on = [ aws_security_group.db_sg ]
}

