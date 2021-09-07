data "aws_availability_zones" "available" {}
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

resource "aws_instance" "tony" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PepperPotts"
  }
  provisioner "local-exec" {
    command = "echo The pub.ip of the created instance is ${aws_instance.tony.public_ip} >> pub_ips.txt"
  }
  provisioner "local-exec" {
    command = "echo The pvt.ip of the created instance is ${aws_instance.tony.private_ip} >> pri_ips.txt"
  }
}
  output "pubIP" {
    value = aws_instance.tony.public_ip
  }

