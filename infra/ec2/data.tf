data "aws_subnet" "pub1" {
  filter {
    name   = "tag:Name"
    values = ["metabase/default/public_1a"]
  }
}

data "aws_vpc" "main" {
  filter {
    name = "tag:Name"
    values = ["metabase/default"]
  }
}

data "aws_security_group" "acesso_ec2_sg" {
  filter {
    name = "group-name"
    values = ["acesso-ec2-sg"]
  }
}

data "aws_security_group" "acesso_eks_sg" {
  filter {
    name = "group-name"
    values = ["acesso-eks-sg"]
  }
}