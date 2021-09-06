resource "aws_instance" "web" {
  count         = 2
  ami           = lookup (var.AMI_ID, var.AWS_REGION)
  instance_type = "t2.micro"

  tags = {
    Name = "${var.INSTANCE_NAME}-${count.index}"
  }
}