data "aws_iam_role" "cluster" {
  name = "eks-node-role"
}

locals {
  configmap_roles = [
    {
      rolearn = data.aws_iam_role.cluster.arn
      username = "node.iam"
      groups =  ["system:bootstrappers","system:nodes"]
    }
  ]
}

resource "kubernetes_config_map" "aws_auth" {

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode(concat(local.configmap_roles, var.map_additional_iam_roles))
    mapUsers = yamlencode(var.map_additional_iam_users)
  }

}

