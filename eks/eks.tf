module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name    = var.app_name
  cluster_version = "1.26"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.create_vpc[0].vpc-Id
  subnet_ids = [module.subnet.*.vpc_private_subnets[0][1],module.subnet.*.vpc_private_subnets[0][2]]

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  eks_managed_node_groups = {
    selfsign = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "spot"
      }

      instance_types = ["t3.micro"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "staging"
  }
}
