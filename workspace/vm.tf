resource "aws_instance" "i1" {
  ami           = var.amiid
  instance_type = var.itype
  tags = {
    env  = terraform.workspace
    Name = var.tgname
  }
}