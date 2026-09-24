terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.66.0"
    }
  }
}

provider "aws" {
  # Configuration options
  access_key = var.akey
  secret_key = var.skey
  region     = var.region
}