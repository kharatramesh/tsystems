resource "terraform_data" "endpoint" {
  input = "https://example.invalid/health"
}

check "endpoint_format" {
  data "terraform_data" "assertion" {
    input = terraform_data.endpoint.output
  }

  assert {
    condition     = startswith(data.terraform_data.assertion.output, "https://")
    error_message = "The endpoint must use HTTPS."
  }
}
