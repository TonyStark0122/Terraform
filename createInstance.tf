resource "aws_instance" "web" {
  count         = 3
  ami           = "${vars.AMI_ID}"
  instance_type = "t2.micro"
  region        = "${vars.AWS_REGION}"

  tags = {
    Name = "${vars.INSTANCE_NAME}-${count.index}"
  }
}
