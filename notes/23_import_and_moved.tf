# Import blocks adopt an existing resource into state during plan/apply.
# Replace the ID and resource details for a real migration.
import {
  to = terraform_data.adopted
  id = "existing-object-id"
}

resource "terraform_data" "adopted" {
  input = "existing-object-id"
}

# Moved blocks preserve state when a resource is renamed.
moved {
  from = terraform_data.old_name
  to   = terraform_data.adopted
}
