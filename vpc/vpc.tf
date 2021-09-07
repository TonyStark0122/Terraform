#create aws VPC
resource "aws_vpc" "pepper" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink  = "false"
 

  tags = {
    Name = "pepper"
  }
}

#Public Subnets
resource "aws_subnet" "pub-1" {
  vpc_id     = aws_vpc.pepper.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-1"
  }
}

resource "aws_subnet" "pub-2" {
  vpc_id     = aws_vpc.pepper.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-2"
  }
}

#private Subnets
resource "aws_subnet" "pri-1" {
  vpc_id     = aws_vpc.pepper.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "pri-1"
  }
}

resource "aws_subnet" "pri-2" {
  vpc_id     = aws_vpc.pepper.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "pri-2"
  }
}

#custom igw
resource "aws_internet_gateway" "pepper-igw-1" {
  vpc_id = aws_vpc.pepper.id
  
  tags = {
    Name = "pepper-igw-1"
  }
}

# Route_Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.pepper.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.pepper-igw-1.id
    }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "pub-1a" {
  subnet_id      = aws_subnet.pub-1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub-2a" {
  subnet_id      = aws_subnet.pub-2.id
  route_table_id = aws_route_table.public.id
}