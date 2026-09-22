terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "labels" {
  type    = map(string)
  default = { team = "platform", cost_center = "42" }
}

# Dynamic blocks generate repeated nested blocks when a provider supports them.
resource "local_file" "generated" {
  filename = "${path.module}/generated-labels.txt"
  content  = join("\n", [for key, value in var.labels : "${key}=${value}"])
}
