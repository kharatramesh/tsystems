resource "aws_security_group" "sg1" {
  name        = var.sgname
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.vpc1.id
  dynamic "ingress" {
    for_each = var.sgports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }

  }
}