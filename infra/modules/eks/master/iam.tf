#lb policy

data "aws_iam_policy" "eks_lb_policy" {
  name = "AWSLoadBalancerControllerIAMPolicy"
}

resource "aws_iam_role" "eks_lb_controller_role" {
  name = format("AmazonEKSLoadBalancerControllerRole-%s", var.cluster_name)
  description = "Amazon LoadBalancer Role to use ALB Controller in to EKS"
  assume_role_policy = data.aws_iam_policy_document.eks_lb_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "eks_lb_policy_attachment" {
    policy_arn = data.aws_iam_policy.eks_lb_policy.arn
    role = aws_iam_role.eks_lb_controller_role.name
}

data "tls_certificate" "eks_cluster_tls" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_cluster_iam_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks_cluster_tls.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

data "aws_iam_policy_document" "eks_lb_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_cluster_iam_oidc.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks_cluster_iam_oidc.arn]
      type        = "Federated"
    }
  }
}

#CSI policy

data "aws_iam_policy" "eks_csi_driver_policy" {
  name = "AmazonEksEbsCsiDriverPolicy"
}

resource "aws_iam_role" "eks_csi_driver_role" {
  name = format("AmazonEksEbsCsiDriverRole-%s", var.cluster_name)
  description = "Amazon CsiDriver Role to use in to EKS"
  assume_role_policy = data.aws_iam_policy_document.eks_csi_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "eks_csi_policy_attachment" {
    policy_arn = data.aws_iam_policy.eks_csi_driver_policy.arn
    role = aws_iam_role.eks_csi_driver_role.name
}

data "aws_iam_policy_document" "eks_csi_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_cluster_iam_oidc.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:csi-aws:aws-csi-driver-controller"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks_cluster_iam_oidc.arn]
      type        = "Federated"
    }
  }
}

