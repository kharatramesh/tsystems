resource "aws_s3_bucket" "bucket2" {
    for_each = var.bcreation
    bucket = each.value.banme
    tags = {
      project = each.value.pname
      env = each.value.env
    }
}