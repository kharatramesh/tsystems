variable "bcreation" {
  type = map(object({
    banme = string
    pname = string
    env   = string
  }))

  default = {
    "project1" = {
      banme = "tsystems-project1-bucket1"
      pname = "google_customer"
      env   = "dev"
    }
    "project2" = {
      banme = "tsystems-project2-bucket1"
      pname = "ibm_customer"
      env   = "dev"
    }
    "project3" = {
      banme = "tsystems-project3-bucket1"
      pname = "tata_customer"
      env   = "uat"
    }
  }
}


  