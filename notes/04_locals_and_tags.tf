variable "project" {
  type    = string
  default = "learning"
}

variable "owner" {
  type    = string
  default = "platform-team"
}

locals {
  common_tags = {
    Project = var.project
    Owner   = var.owner
    Managed = "terraform"
  }
}

resource "terraform_data" "tags" {
  input = local.common_tags
}
