terraform {
  required_version = ">= 1.4.0"
}

# The built-in terraform_data resource needs no cloud account.
resource "terraform_data" "hello" {
  input = "Hello, Terraform!"
}

output "message" {
  value = terraform_data.hello.output
}
