variable "cluster_name" {
    description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
    type = string
}

variable "kubernetes_version" {
    description = "Kubernetes version to use for the EKS cluster."
    type = string
}

variable "private_subnet" {
    description = "A private subnets to place the EKS cluster and workers within."
    type = list(any)
}

variable "public_subnet" {
    description = "A list of public subnets to place the EKS cluster and workers within."
    type    = list(any)
}

variable "cluster_endpoint_private_access" {
    description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
    type = bool
}
variable "cluster_endpoint_public_access"{
    description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
    type = bool
}

variable "sg" {
    description = "A list of security groups to place the EKS cluster and workers within."
    type    = list(any)
}

variable "master_role_name" {
    description = "Name of the master role"
    type    = string
}
