locals {
  role_name = {

    eks = "eks-cluster-role"
    eks-node = "eks-node-role"
    
    }
}


module "iam_role" {
    source = "./modules/iam_role"
    for_each = local.role_name
    role_name = each.value
    sts_assume_role = each.key
}