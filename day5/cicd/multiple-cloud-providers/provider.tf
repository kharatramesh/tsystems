terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.10.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.7.0"
    }
  }
}

# AWS account 1
provider "aws" {
  alias      = "trainer"
  access_key = var.akey
  secret_key = var.skey
  region     = var.region
}

# AWS account 2
provider "aws" {
  alias      = "bruno"
  access_key = var.akey1
  secret_key = var.skey1
  region     = var.region1
}

# provider "azurerm" {
#   alias = "azurerm1"
#   features {}
# }

# # provider "google" {
#   alias = "gcp1"
# }
