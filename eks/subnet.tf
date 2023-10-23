data "aws_availability_zones" "available_az" {}

module "subnet" {
  count_az  = length(data.aws_availability_zones.available_az.names)
  source    = "./modules/subnet"
  vpc_id    = module.create_vpc[0].vpc-Id
  cidr      = var.cidr
  newbits   = var.newbits
}