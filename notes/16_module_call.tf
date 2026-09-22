# Module calls compose reusable infrastructure. The referenced folder is an example
# contract; create ./modules/service/main.tf when turning this into a live project.
module "service" {
  source = "./modules/service"

  name     = "catalog"
  replicas = 2
}

output "service_id" {
  value = module.service.id
}
