resource "aws_instance" "samosa" {
  ami           = "ami-066c4849e6b3a1e3d"
  instance_type = "t2.micro"
  tags = {
    Name = "trainer-samosa"
  }
}