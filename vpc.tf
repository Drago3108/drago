provider "aws" {
region = "us-west-2"
}

resource "aws_vpc" "main-pjt" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main-pjt"
  }
}

resource "aws_subnet" "main-pjt-sb1" {
  availability_zone       = "us-west-2a"
  cidr_block              = "11.0.0.0/24"
  vpc_id                  = aws_vpc.main-pjt.id
  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "main-pjt-sb2" {
  availability_zone       = "us-west-2b"
  cidr_block              = "11.0.5.0/24"
  vpc_id                  = aws_vpc.main-pjt.id
  map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main-pjt.id
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main-pjt.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  }
resource "aws_route_table_association" "sb1" {
  subnet_id      = aws_subnet.main-pjt-sb1.id
  route_table_id = aws_route_table.rtb.id
}


