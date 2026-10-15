terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = var.location
  access_key = var.akey
  secret_key = var.skey
}