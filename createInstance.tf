resource "aws_key_pair" "tony" {
  key_name   = "tony"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "web" {
  count         = 2
  ami           = lookup (var.AMI_ID, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tony.key_name
  security_groups = "${var.Security_Group}"

  tags = {
    Name = "${var.INSTANCE_NAME}-${count.index}"
  }


provisioner "file" {
  source    = "nginx.sh"
  destination = "/tmp/nginx.sh"
}

provisioner "remote-exec" {
  inline = [
      "sudo chmod +x /tmp/nginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/nginx.sh",  # Remove the spurious CR characters.
      "sudo /tmp/nginx.sh",
  ]
}

connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

