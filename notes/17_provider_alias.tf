terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider aliases let one configuration target multiple regions/accounts.
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
}

resource "aws_s3_bucket" "primary" {
  bucket = "replace-with-a-unique-primary-bucket-name"
}

resource "aws_s3_bucket" "secondary" {
  provider = aws.secondary
  bucket   = "replace-with-a-unique-secondary-bucket-name"
}
