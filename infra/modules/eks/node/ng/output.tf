output "asg_name" {
    value = aws_eks_node_group.eks_node_group.resources.0.autoscaling_groups.0.name
}

