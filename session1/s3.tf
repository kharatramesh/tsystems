
resource "aws_s3_bucket" "bucket1" {
  count  = length(var.bname)
  bucket = var.bname[count.index]
  tags = {
    Name        = var.bname[count.index]
    Environment = "Dev"
  }
}



