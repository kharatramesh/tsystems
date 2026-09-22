
resource "aws_key_pair" "key1" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1["subnet1"].id
  key_name               = aws_key_pair.key1.key_name
  vpc_security_group_ids = [aws_security_group.sg1.id]
 
  tags = {
    Name = var.ec2name
  }
}