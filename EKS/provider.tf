# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }
  }

  required_version = "~> 1.3"
   
    backend "s3" {
    bucket       = "tsystems-terraform-state-22092026"
    key          = "tsystems/terraform.tfstate"
    encrypt      = true
    use_lockfile = true # Enables native S3 state locking
  }
}

