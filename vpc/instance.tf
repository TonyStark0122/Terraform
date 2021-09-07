data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "tony" {
    key_name = "tony"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "pepper" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.apache.id]
  subnet_id = aws_subnet.pub-1.id
  tags = {
    Name = "pepper"
  }
}