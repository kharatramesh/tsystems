resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "trainer-sg-modules"
    }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
        Name = "trainer-vpc-modules"
    }
}

resource "aws_subnet" "s1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
        Name = "trainer-subnet-modules"
    }

}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
    tags = {
        Name = "trainer-igw1-modules"
    }
}


resource "aws_route_table_association" "ra1" {
    subnet_id = aws_subnet.s1.id
    route_table_id = aws_route_table.rt1.id
  
}


resource "aws_security_group" "sg1" {
  name = var.sgname
  vpc_id = aws_vpc.vpc1.id
  ingress = {
    from_port = 80
    to_port = 80
    protocol ="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}