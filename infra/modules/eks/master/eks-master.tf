data "aws_iam_role" "cluster" {
  name = var.master_role_name
}

resource "aws_eks_cluster" "eks_cluster" {

  name     = var.cluster_name
  role_arn = data.aws_iam_role.cluster.arn
  version  = var.kubernetes_version
  
  vpc_config {
      security_group_ids      = var.sg
      endpoint_private_access = var.cluster_endpoint_private_access
      endpoint_public_access = var.cluster_endpoint_public_access
      subnet_ids = concat(var.public_subnet, var.private_subnet)
  }

  tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
  
  depends_on = [
    data.aws_iam_role.cluster
  ]

}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = var.cluster_name
  
  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}

