
resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  version  = var.version
  role_arn = var.eks_role_arn

  vpc_config {

    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = ["0.0.0.0/0"]

    subnet_ids = var.private_subnet
  }
}
