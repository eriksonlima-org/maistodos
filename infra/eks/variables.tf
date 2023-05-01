// Master
variable "cluster_name" {
  type    = string
  default = "maistodos"
}
variable "kubernetes_version" {
  type    = string
  default = "1.25"
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = false
}

variable "image_id" {
  type = string
  description = "Instance Image ID"
  default     = "ami-0bd3c2e379f7f09c9"
}

variable "eks_node_role_name" {
  type    = string
  default = "eks-node-role"
}

variable "master_role_name" {
  type = string
  default = "eks-master-role"
}

//Node Metabase
variable "instance_type" {
  type    = string
  default = "t3a.medium"
}
variable "node_name"{
  type    = string
  default = "NG-METABASE"
}

variable "environment" {
  type    = string
  default = "metabase"
}

// aws-auth

variable "map_additional_iam_roles" {
  description = "Additional IAM roles to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [

    {
      rolearn  = "arn:aws:iam::021708085540:role/eks-node-role"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers","system:nodes"]
    }
  ]
}

variable "map_additional_iam_users" {
  description = "Additional IAM users to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::021708085540:user/terraform-aws"
      username = "terraform-aws"
      groups   = ["system:masters"]
    },
  ]
}


