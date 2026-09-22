variable "ports" {
  type    = list(number)
  default = [80, 443]
}

variable "service_settings" {
  type = object({
    name     = string
    enabled  = bool
    replicas = number
  })
  default = {
    name     = "web"
    enabled  = true
    replicas = 2
  }
}

resource "terraform_data" "configuration" {
  input = {
    ports   = var.ports
    service = var.service_settings
  }
}
