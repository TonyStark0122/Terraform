resource "aws_security_group" "apache" {
  name        = "apache"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.pepper.id

  ingress = [
    {
      description      = "ssh from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    },

    {
      description      = "http from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name = "apache"
  }
}