variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

resource "terraform_data" "environment" {
  input = "Running in ${var.environment}"
}

output "environment_message" {
  value = terraform_data.environment.output
}
