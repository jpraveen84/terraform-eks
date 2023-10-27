output "vpc-id" {
  value = module.create_vpc[0].vpc-Id
}


output "public-subnets" {
  value = module.subnet.*.vpc_public_subnets[0]
}

output "private-subnets" {
  value = module.subnet.*.vpc_private_subnets[0]
}

# output "eks_cluster_role_arn" {
#   value = module.iam_role.eks_role_arn
# }

output "aws_role_arns" {
  value = module.iam_role["eks"]
  
}

# output "iam_role_arns" {
#   value = {
#     for role_key, role in module.iam_role :
#     role_key => role.outputs.arn
#   }
# }