resource "aws_s3_bucket" "b1" {
  bucket = "tsystems-google-project-${terraform.workspace}"
  tags = {
    Name        = "Mybucket"
    Environment = terraform.workspace
  }
}

output "bucket_name" {
  value = aws_s3_bucket.b1.bucket
}

resource "aws_instance" "web" {
  ami           = "ami-066c4849e6b3a1e3d"
  instance_type = terraform.workspace == "prod" ? "t2.medium" : terraform.workspace == "dev" ? "t2.micro" : "t2.small"
  
  tags = {
    Name = "Tsystems-Instance-${terraform.workspace}"
  }
}

output "instance_tag" {
  value = aws_instance.web.tags["Name"]
}