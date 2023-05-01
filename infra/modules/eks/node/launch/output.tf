output "launch_template_name" {
    value = aws_launch_template.eks_launch_template.name
}

output "launch_template_id" {
    value = aws_launch_template.eks_launch_template.id
}

output "launch_template_version" {
    value = aws_launch_template.eks_launch_template.latest_version
}


