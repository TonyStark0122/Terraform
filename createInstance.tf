resource "aws_instance" "web" {
  count         = 2
  ami           = "${var.AMI_ID}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.INSTANCE_NAME}-${count.index}"
  }
}