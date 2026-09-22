resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "trainer-vpc1"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  for_each          = var.subnets
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.azone
  tags = {
    Name = each.value.subnet_name
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = var.igw
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
  tags = {
    Name = "trainer-rt1"
  }
}

resource "aws_route_table_association" "rta1" {
  for_each       = aws_subnet.subnet1
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt1.id
}
