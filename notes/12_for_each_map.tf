variable "environments" {
  type = map(string)
  default = {
    dev  = "small"
    prod = "large"
  }
}

resource "terraform_data" "environment" {
  for_each = var.environments
  input = {
    name = each.key
    size = each.value
  }
}

output "environment_names" {
  value = keys(terraform_data.environment)
}
