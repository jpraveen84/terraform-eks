module "create_vpc" {
  count                = var.create_vpc == true ? 1 : 0
  source               = "./modules/vpc"
  cidr                 = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  app_name             = var.app_name
  env                  = var.env
}