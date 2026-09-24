resource "aws_s3_bucket" "b1" {
  provider = aws.tsystem-aws1
  bucket   = "vadapav-bucket-tsystems-13"
  tags = {
    Name = "test1"
  }
#   lifecycle {
#     create_before_destroy = "true"
#   }
}

resource "aws_s3_bucket" "b2" {
  provider = aws.tsystem-aws2
  bucket   = "vadapav-bucket-tsystems-22"
  tags = {
    Name = "test1"
    "version" = "1.0"
  }
  lifecycle {
    prevent_destroy = "true"
    ignore_changes = [ tags ]
  }
}

# resource "azurerm_resource_group" "rg1" {
#   provider = tsystems-azure1
#   name = "tsystems-rg-1"
#   location = "east us"
# }

# resource "google_cloud_storage" "gcp1" {
#     provider = tsystems-gcp1
#     name = "tsystems-gcp1"
# }