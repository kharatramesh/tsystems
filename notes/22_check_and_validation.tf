variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be dev, stage, or prod."
  }
}

resource "terraform_data" "validated" {
  input = var.environment

  lifecycle {
    precondition {
      condition     = length(var.environment) > 0
      error_message = "environment cannot be empty."
    }
  }
}
