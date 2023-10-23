output "vpc-id" {
  value = module.create_vpc[0].vpc-Id
}


output "public-subnets" {
  value = module.subnet.*.vpc_public_subnets[0]
}

output "private-subnets" {
  value = module.subnet.*.vpc_private_subnets[0]
}