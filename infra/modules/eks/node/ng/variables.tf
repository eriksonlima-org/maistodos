variable "cluster_name" {
    description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
    type = string
}
variable "private_subnet" {
    description = "A private subnets list to place the EKS cluster and workers within."
    type = list(any)
}
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

variable "node_name"{
    type    = string
    description = "Name of the Node group. Also used as a prefix in names of related resources"
}

variable "launch_template_name"{
    type = string
    description = "launch template name"
}

variable "launch_template_version" {
    type = string
    description = "launch template version"
}

variable "environment" {
    type = string
    description = "Node Group environment label"
}

variable "eks_node_role_name" {
    type = string
    description = "eks node role name"
}
