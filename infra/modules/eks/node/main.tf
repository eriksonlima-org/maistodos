module "node" {
  source = "./ng"

  node_name           = var.node_name
  cluster_name        = var.cluster_name

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size

  environment = var.environment
  
  launch_template_name = module.launch.launch_template_name
  launch_template_version = module.launch.launch_template_version

  private_subnet      = var.private_subnet
  eks_node_role_name  = var.eks_node_role_name
  
  depends_on = [
    module.launch
  ]
}

module "launch"{
  source = "./launch"

  cluster_name        = var.cluster_name
  node_name           = var.node_name
  kubernetes_version  = var.kubernetes_version
  image_id            = var.image_id

  cluster_security_group = var.cluster_security_group
  cluster_certificate = var.cluster_certificate
  cluster_endpoint    = var.cluster_endpoint

  instance_type  = var.instance_type
  sg        = var.sg
}

