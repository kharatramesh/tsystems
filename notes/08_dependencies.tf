resource "terraform_data" "network" {
  input = "network-ready"
}

resource "terraform_data" "application" {
  input      = "application-after-network"
  depends_on = [terraform_data.network]
}
