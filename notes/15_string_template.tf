variable "app_name" {
  type    = string
  default = "catalog"
}

locals {
  config = templatefile("${path.module}/app.conf.tftpl", {
    app_name = var.app_name
    port     = 8080
  })
}

resource "terraform_data" "rendered_config" {
  input = local.config
}
