resource "terraform_data" "application" {
  input = {
    name    = "inventory-api"
    version = "1.0.0"
  }
}

output "application_name" {
  description = "A value exposed after apply"
  value       = terraform_data.application.output.name
}

output "application_object" {
  sensitive = false
  value     = terraform_data.application.output
}
