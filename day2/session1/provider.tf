terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = var.region
  access_key = var.akey
  secret_key = var.skey

}