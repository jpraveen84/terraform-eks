locals {
  tags = {
    Name = var.app_name
    Env  = var.env
  }
}

resource "aws_vpc" "self-annalise" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = local.tags
}

