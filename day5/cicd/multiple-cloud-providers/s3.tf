resource "aws_s3_bucket"  "b1" {
  provider = aws.trainer
  bucket = "trainer-multiple-cloud -provider"
}

resource "aws_s3_bucket" "b2" {
provider = aws.bruno  
 bucket = "bruno-multiple-cloud -provider"
}

# resource "azurerm_resource_group" "rg1" {
#   provider = azurerm.azurerm1
#   name = "test1"
#   location = "useat"
# }
