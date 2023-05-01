resource "aws_instance" "maistodos_git_runner" {
  ami = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.pub1.id
  key_name = "erikson"
  associate_public_ip_address = true
  vpc_security_group_ids = [ data.aws_security_group.acesso_ec2_sg.id, data.aws_security_group.acesso_eks_sg.id ]
  
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/git-runner"}
  )
}