# Terraform Cloud/Enterprise workspaces can provide these values as variables.
variable "deployment_id" {
  type      = string
  sensitive = true
}

resource "terraform_data" "deployment" {
  input = {
    id     = var.deployment_id
    source = "workspace-variable"
  }
}
