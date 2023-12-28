resource "aws_vpc" "devops_vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = "devops-assignment-4"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.devops_vpc.id
  cidr_block = "172.31.0.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "cs423-devops-public-1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.devops_vpc.id
  cidr_block = "172.31.80.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cs423-devops-private-1"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.devops_vpc.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops_vpc.id
}