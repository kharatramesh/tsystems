terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 5.0.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 8.0.0"
    }
  }
}

provider "aws" {
  # Configuration options
  alias      = "tsystem-aws1"
  access_key = var.akey
  secret_key = var.skey
  region     = var.region
}

provider "aws" {
  # Configuration options
  alias      = "tsystem-aws2"
  access_key = var.akey
  secret_key = var.skey
  region     = var.region1
}

# provider "azurerm" {
#     alias = tsystems-azure1
#     features {}
# }

# provider "google" {
#    alias = tsystems-gcp1
# }