resource "aws_instance" "web" {
  count         = 5
  ami           = "${vars.AMI_ID}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}
