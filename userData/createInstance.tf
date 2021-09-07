resource "aws_key_pair" "tony" {
  key_name   = "tony"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "tony" {
  ami           = lookup (var.AMI_ID, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tony.key_name
  security_groups = "${var.Security_Group}"

  tags = {
    Name = "tony"
  }


user_data = data.template_cloudinit_config.apache_config.rendered
}
output "ip" {
  value = aws_instance.tony.public_ip
}
