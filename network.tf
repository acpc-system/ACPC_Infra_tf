#this is to create vpc for main acpc
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "acpc-vpc"
  }
}

# internet gatway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "acpc-gw"
  }
}

# subnets
resource "aws_subnet" "pubsub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pubsub1cidr

  tags = {
    Name = "acpc-publicA"
  }
}
##
resource "aws_subnet" "pubsub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pubsub2cidr

  tags = {
    Name = "acpc-publicB"
  }
}
##
resource "aws_subnet" "privsub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.privsub1cidr

  tags = {
    Name = "acpc-privateA"
  }
}
##
resource "aws_subnet" "privsub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.privsub2cidr

  tags = {
    Name = "acpc-privateB"
  }
}

## aws_eip
resource "aws_eip" "nat" {
#  instance = aws_instance.web.id
  vpc      = true
}

## nat getway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.pubsub2.id

  tags = {
    Name = "acpc-gw"
  }

  depends_on = [aws_internet_gateway.gw]
}
