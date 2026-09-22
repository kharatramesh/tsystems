variable "enable_monitoring" {
  type    = bool
  default = true
}

locals {
  tier = var.enable_monitoring ? "observed" : "basic"
}

resource "terraform_data" "service" {
  input = {
    tier              = local.tier
    monitoring_status = var.enable_monitoring ? "enabled" : "disabled"
  }
}
