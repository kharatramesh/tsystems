resource "terraform_data" "managed_value" {
  input = {
    name  = "service"
    owner = "terraform"
  }

  lifecycle {
    ignore_changes = [input.owner]
  }
}
