# Data sources read existing information rather than creating it.
data "terraform_remote_state" "example" {
  backend = "local"
  config = {
    path = "./example.tfstate"
  }
}

output "remote_state_values" {
  value = data.terraform_remote_state.example.outputs
}
