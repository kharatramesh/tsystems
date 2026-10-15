resource "aws_s3_bucket" "b1" {
  bucket = var.bname
  tags = {
    "env"     = terraform.workspace
    "project" = var.bname
  }
}