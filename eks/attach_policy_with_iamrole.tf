# locals {
#   attach_policy = {
#     "eks-cluster-role" = {
#       policy_arn = {
#         eks_policy  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#       }
#     }
#   }
# }

# module "attach_policy" {
#   source     = "./modules/iam_attach_policy"
#   for_each   = local.attach_policy
#   role_name  = [each.key]
#   policy_arn = each.value.policy_arn
# }