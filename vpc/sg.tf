resource "aws_security_group" "apache" {
  name        = "apache"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.pepper.id

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "ssh"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apache"
  }
}