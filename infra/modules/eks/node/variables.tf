//Node
variable "desired_size" {
    description = "Desired number of worker nodes."
    type = string
}
variable "max_size" {
    description = "Maximum number of worker nodes."
    type = string
}
variable "min_size" {
    description = "Minimum number of worker nodes."
    type = string
}
variable "instance_type" {
    description = "Instance type definition for worker launch template"
    type = string
}
variable "node_name" {
  type = string
  description = "Amazon node group name"
}
variable "environment" {
    type = string
    description = "Node Group environment label"
}
variable "private_subnet" {
    description = "A private subnets list to place the EKS cluster and workers within."
    type = list(any)
}
variable "image_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "eks_node_role_name" {
    type = string
    description = "eks node role name"
}


// Master
variable "kubernetes_version" {
    description = "Kubernetes version to use for the EKS cluster."
    type = string
}
variable "cluster_certificate" {
  description = "Amazon EKS CA certificate."
}
variable "cluster_endpoint" {
  description = "Amazon EKS private API server endpoint."
}
variable "sg" {
    description = "A list of security groups to place the EKS cluster and workers within."
    type    = string
}
variable "cluster_security_group"{
    description = "The EKS cluster managed security groups to place the workers."
}
variable "cluster_name" {
  type = string
  description = "Amazon EKS cluster name"
}


