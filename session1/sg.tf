resource "aws_security_group" "sg1" {
  count      = length(var.sgname)
  name        = var.sgname[count.index]
  description = "Security group"
  vpc_id      = "vpc-0fd502659689ce71b"
  tags = {
    Name        = var.sgname[count.index]
    Environment = "Dev"
  }

}