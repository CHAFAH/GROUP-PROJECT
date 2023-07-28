module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "project_cluster"
  cluster_version = "1.27"

  vpc_id                          = aws_vpc.projectvpc.id
  subnet_ids                      = [aws_subnet.proj-priv-1.id, aws_subnet.proj-priv-2.id]
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "general"
      }

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }
}