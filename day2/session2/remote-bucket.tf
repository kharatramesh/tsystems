resource "aws_s3_bucket" "buckets" {
  bucket = "tsystems-terraform-state-22092026"
  tags = {
    dish = "vada pav"
  }
}