variable "users" {
  type    = list(string)
  default = ["alice", "bob", "carol"]
}

locals {
  uppercase_users = [for user in var.users : upper(user)]
  user_map        = { for user in var.users : user => "active" }
}

output "transformed_users" {
  value = {
    names  = local.uppercase_users
    status = local.user_map
  }
}
