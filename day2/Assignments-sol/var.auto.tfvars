
vpc_cidr        = "11.11.11.0/24"
region          = "eu-west-1"
akey            = "AKXY"
skey            = "zF3GIYu"
igw             = "trainer-igw1"
sgname          = "trainer-sg1"
key_name        = "trainer-key1"
public_key_path = "c:/Users/ADMIN/.ssh/id_rsa.pub"
ec2name         = "trainer-ec2"
ami             = "ami-0bb3219a6f810a089"
instance_type   = "t2.micro"
subnets = {
  subnet1 = {
    subnet_name = "trainer-subnet1"
    cidr_block  = "11.11.11.0/28"
    azone       = "eu-west-1a"
  }
  subnet2 = {
    subnet_name = "trainer-subnet2"
    cidr_block  = "11.11.11.16/28"
    azone       = "eu-west-1b"
  }
}

sgports = [{ from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 443, to_port = 443, protocol = "tcp", description = "Allow HTTPS", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 3306, to_port = 3306, protocol = "tcp", description = "Allow MySQL", cidr_blocks = ["0.0.0.0/0"] },
{ from_port = 5432, to_port = 5432, protocol = "tcp", description = "Allow PostgreSQL", cidr_blocks = ["0.0.0.0/0"] }]
