data "aws_subnet" "pub1" {
  filter {
    name   = "tag:Name"
    values = ["metabase/default/public_1a"]
  }
}

data "aws_subnet" "pub2" {
  filter {
    name   = "tag:Name"
    values = ["metabase/default/public_1c"]
  }
}

data "aws_subnet" "priv1" {
  filter {
    name   = "tag:Name"
    values = ["metabase/default/private_app_1a"]
  }
}

data "aws_subnet" "priv2" {
  filter {
    name   = "tag:Name"
    values = ["metabase/default/private_app_1c"]
  }
}

data "aws_security_group" "acesso_eks" {
  name = "acesso-eks-sg"
}
