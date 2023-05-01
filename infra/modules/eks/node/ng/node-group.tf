data "aws_iam_role" "node" {
  name = var.eks_node_role_name
}

resource "aws_eks_node_group" "eks_node_group" {

  cluster_name    = var.cluster_name
  node_group_name = format("${var.node_name}-%s", var.cluster_name)
  node_role_arn   = data.aws_iam_role.node.arn
  
  subnet_ids = var.private_subnet

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }

  launch_template { 
   name = var.launch_template_name
   version = var.launch_template_version
  }

  labels = {
    environment = var.environment
  }
}


