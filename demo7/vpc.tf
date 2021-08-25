resource "aws_vpc" "demo7" {
  cidr_block           = "10.5.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "demo7"
  }
}

resource "aws_subnet" "demo7-public-1" {
  cidr_block              = "10.5.1.0/24"
  vpc_id                  = aws_vpc.demo7.id
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "demo7-public-1"
  }
}

resource "aws_subnet" "demo7-public-2" {
  cidr_block              = "10.5.2.0/24"
  vpc_id                  = aws_vpc.demo7.id
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "demo7-public-2"
  }
}

resource "aws_subnet" "demo7-private-1" {
  cidr_block              = "10.5.3.0/24"
  vpc_id                  = aws_vpc.demo7.id
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "demo7-private-1"
  }
}

resource "aws_subnet" "demo7-private-2" {
  cidr_block              = "10.5.4.0/24"
  vpc_id                  = aws_vpc.demo7.id
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "demo7-private-2"
  }
}

resource "aws_internet_gateway" "demo7-ig" {
  vpc_id = aws_vpc.demo7.id
  tags = {
    Name = "demo7-ig"
  }
}

resource "aws_route_table" "demo7-public" {
  vpc_id = aws_vpc.demo7.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo7-ig.id
  }
  tags = {
    Name = "demo7-public"
  }
}

resource "aws_route_table_association" "demo7-public-1-a" {
  route_table_id = aws_route_table.demo7-public.id
  subnet_id      = aws_subnet.demo7-public-1.id
}

resource "aws_route_table_association" "demo7-public-2-a" {
  route_table_id = aws_route_table.demo7-public.id
  subnet_id      = aws_subnet.demo7-public-2.id
}
