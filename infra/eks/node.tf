module "node_metabase" {
  source = "../modules/eks/node"

//Node
  node_name           = var.node_name
  cluster_name        = var.cluster_name
  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size
  environment = var.environment
  private_subnet = tolist([data.aws_subnet.priv1.id, data.aws_subnet.priv2.id])
  eks_node_role_name = var.eks_node_role_name

//Launch
  kubernetes_version  = var.kubernetes_version
  cluster_security_group = module.master.cluster_security_group
  cluster_certificate = module.master.cluster_certificate
  cluster_endpoint    = module.master.cluster_endpoint
  instance_type  = var.instance_type
  image_id       = var.image_id
  sg        = data.aws_security_group.acesso_eks.id

}
