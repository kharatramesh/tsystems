variable "worker_count" {
  type    = number
  default = 3
}

resource "terraform_data" "worker" {
  count = var.worker_count
  input = "worker-${count.index + 1}"
}

output "workers" {
  value = terraform_data.worker[*].output
}
