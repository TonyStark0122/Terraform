#Elastic_ip
resource "aws_eip" "eip-1" {
  vpc      = true
}

resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.pri-1.id

  tags = {
    Name = "nat-1"
  }
  depends_on = [aws_internet_gateway.pepper-igw-1]
}

#rt for connecting NAT with pri subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.pepper.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.nat-1.id
    }

  tags = {
    Name = "private"
  }
}

# rt association private
resource "aws_route_table_association" "pri-1a" {
  subnet_id      = aws_subnet.pri-1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "pri-1b" {
  subnet_id      = aws_subnet.pri-2.id
  route_table_id = aws_route_table.private.id
}