data "aws_availability_zones" "available" {}


module "routetable" {
  count_az       = length(data.aws_availability_zones.available.names)
  source         = "./modules/routetable"
  vpc_id         = module.create_vpc[0].vpc-Id
  public_subnet  = module.subnet.*.vpc_public_subnets[0]
  private_subnet = module.subnet.*.vpc_private_subnets[0]
  app_name       = var.app_name
}