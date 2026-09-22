resource "terraform_data" "important_state" {
  input = "protect-this-resource"

  lifecycle {
    # Remove this guard only when intentional destruction is required.
    prevent_destroy = true
  }
}
