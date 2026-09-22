variable "api_token" {
  description = "Pass with TF_VAR_api_token; never commit the value."
  type        = string
  sensitive   = true
}

resource "terraform_data" "credential_consumer" {
  input = {
    token_present = var.api_token != ""
  }
}

output "token_present" {
  value = terraform_data.credential_consumer.output.token_present
}
