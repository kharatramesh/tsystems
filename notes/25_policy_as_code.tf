# Example Terraform Cloud/Enterprise policy concept using Sentinel-style intent.
# This file documents a policy input that a CI pipeline can enforce before apply.
variable "approved_regions" {
  type    = set(string)
  default = ["us-east-1", "us-west-2"]
}

variable "requested_region" {
  type    = string
  default = "us-east-1"
}

resource "terraform_data" "policy_input" {
  input = {
    requested_region = var.requested_region
    approved         = contains(var.approved_regions, var.requested_region)
    policy           = "region-allowlist"
  }

  lifecycle {
    precondition {
      condition     = contains(var.approved_regions, var.requested_region)
      error_message = "The requested region is not approved by policy."
    }
  }
}
