module "network" {
  source      = "../network"
  vpc_cidr    = "21.21.21.0/24"
  subnet_cidr = "21.21.21.0/25"
  azone       = var.azone
  #   sgname      = "trainer-modules-tsystems-sg1"

}

module "compute" {
  source = "../compute"
  #   sg        = module.network.sg_id.id
  itype     = var.itype
  subnet_id = module.network.subnet_id
  azone     = var.azone
}