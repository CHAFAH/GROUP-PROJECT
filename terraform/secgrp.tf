resource "aws_security_group" "GrpProject_SG" {
  vpc_id      = aws_vpc.projectvpc.id
  description = "all traffic to eks cluster"
  name = "all_traffic"

  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "allow_all_traffic"
  }
}