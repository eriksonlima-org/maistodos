# Resources related to the VPC: vpc, peering, default_sg, route_tables.
resource "aws_vpc" "main" {
  cidr_block           = local.cidr_block
  enable_dns_hostnames = true

  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}" }
  )
}
output "vpc_id" { value = aws_vpc.main.id }
output "vpc_arn" { value = aws_vpc.main.arn }
output "vpc_cidr" { value = aws_vpc.main.cidr_block }

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    local.tags,
    { Name = local.project_name }
  )
}

resource "aws_eip" "eip_nat_subnet_public_1a" {
  vpc = true
  tags = merge(
    local.tags,
    {Name = "${local.project_name}/${local.environment}/eip_nat_subnet_public_1a"}
  )
}

resource "aws_eip" "eip_nat_subnet_public_1c" {
  vpc = true
  tags = merge(
    local.tags,
    {Name = "${local.project_name}/${local.environment}/eip_nat_subnet_public_1c"}
  )
}

resource "aws_nat_gateway" "nat_subnet_app_1a" {
  allocation_id = aws_eip.eip_nat_subnet_public_1a.id
  subnet_id = aws_subnet.public_1a.id
  tags = merge(
    local.tags,
    {Name = "${local.project_name}/${local.environment}/nat_subnet_app_1a"}
  )
}

resource "aws_nat_gateway" "nat_subnet_app_1c" {
  allocation_id = aws_eip.eip_nat_subnet_public_1c.id
  subnet_id = aws_subnet.public_1c.id
  tags = merge(
    local.tags,
    {Name = "${local.project_name}/${local.environment}/nat_subnet_app_1c"}
  )
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_route_table.public.id
  tags = merge(
    local.tags,
    {Name = "${local.project_name}/${local.environment}/default"}
  )
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/default" }
  )
}

resource "aws_route_table" "public" {
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/public" }
  )
  vpc_id     = aws_vpc.main.id
  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "rtb_subnet_app_private_1a" {
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/rtb_subnet_app_private_1a" }
  )
  vpc_id          = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_subnet_app_1a.id
  }
  depends_on      = [aws_nat_gateway.nat_subnet_app_1a]
}

resource "aws_route_table" "rtb_subnet_app_private_1c" {
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/rtb_subnet_app_private_1c" }
  )
  vpc_id     = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_subnet_app_1c.id
  }
  depends_on = [aws_nat_gateway.nat_subnet_app_1c]
}

resource "aws_route_table" "rtb_subnet_db_private_1a" {
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/rtb_subnet_db_private_1a" }
  )
  vpc_id     = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_subnet_app_1a.id
  }
  depends_on = [aws_nat_gateway.nat_subnet_app_1a]
}

resource "aws_route_table" "rtb_subnet_db_private_1c" {
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/rtb_subnet_db_private_1c" }
  )
  vpc_id     = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_subnet_app_1c.id
  }
  depends_on = [aws_nat_gateway.nat_subnet_app_1a]
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}