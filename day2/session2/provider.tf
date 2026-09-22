terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }

  backend "s3" {
    bucket       = "tsystems-terraform-state-22092026"
    key          = "tsystems/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true # Enables native S3 state locking
  }
}


provider "aws" {
  # Configuration options
  region     = var.region
  access_key = var.akey
  secret_key = var.skey

}

