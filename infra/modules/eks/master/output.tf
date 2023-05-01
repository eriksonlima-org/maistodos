output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}
output "cluster_security_group"{
  value = aws_eks_cluster.eks_cluster.vpc_config.0.cluster_security_group_id
}
output "cluster_certificate"{
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
output "cluster_endpoint"{
  value = aws_eks_cluster.eks_cluster.endpoint
}
output "cluster_token"{
  value = data.aws_eks_cluster_auth.eks_cluster.token
}

