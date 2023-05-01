# -- public subnets -- #
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}a"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 1)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/public_1a" },
    { "kubernetes.io/cluster/maistodos" = "shared"},
    { "kubernetes.io/role/elb" = 1 }
  )
}
resource "aws_route_table_association" "public_1a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1a.id
}
output "subnet_public_1a_id" { value = aws_subnet.public_1a.id }
output "subnet_public_1a_cidr" { value = aws_subnet.public_1a.cidr_block }
output "subnet_public_1a_arn" { value = aws_subnet.public_1a.arn }
output "subnet_public_1a_az" { value = aws_subnet.public_1a.availability_zone }

resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}c"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 2)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/public_1c" },
    { "kubernetes.io/cluster/maistodos" = "shared"},
    { "kubernetes.io/role/elb" = 1 }
  )
}

resource "aws_route_table_association" "public_1c" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1c.id
}
output "subnet_public_1c_id" { value = aws_subnet.public_1c.id }
output "subnet_public_1c_cidr" { value = aws_subnet.public_1c.cidr_block }
output "subnet_public_1c_arn" { value = aws_subnet.public_1c.arn }
output "subnet_public_1c_az" { value = aws_subnet.public_1c.availability_zone }

# -- app private subnets -- #

resource "aws_subnet" "private_app_1a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}a"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 3)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/private_app_1a" },
    { "kubernetes.io/cluster/maistodos" = "shared"},
    { "kubernetes.io/role/internal-elb" = 1 }
  )
}
resource "aws_route_table_association" "private_app_1a" {
  route_table_id = aws_route_table.rtb_subnet_app_private_1a.id
  subnet_id      = aws_subnet.private_app_1a.id
}

output "subnet_private_app_1a_id" { value = aws_subnet.private_app_1a.id }
output "subnet_private_app_1a_cidr" { value = aws_subnet.private_app_1a.cidr_block }
output "subnet_private_app_1a_arn" { value = aws_subnet.private_app_1a.arn }
output "subnet_private_app_1a_az" { value = aws_subnet.private_app_1a.availability_zone }


resource "aws_subnet" "private_app_1c" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}c"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 4)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/private_app_1c" },
    { "kubernetes.io/cluster/maistodos" = "shared"},
    { "kubernetes.io/role/internal-elb" = 1 }
  )
}
resource "aws_route_table_association" "private_app_1c" {
  route_table_id = aws_route_table.rtb_subnet_app_private_1c.id
  subnet_id      = aws_subnet.private_app_1c.id
}
output "subnet_private_app_1c_id" { value = aws_subnet.private_app_1c.id }
output "subnet_private_app_1c_cidr" { value = aws_subnet.private_app_1c.cidr_block }
output "subnet_private_app_1c_arn" { value = aws_subnet.private_app_1c.arn }
output "subnet_private_app_1c_az" { value = aws_subnet.private_app_1c.availability_zone }


# -- db private subnets -- #

resource "aws_subnet" "private_db_1a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}a"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 5)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/private_db_1a" }
  )
}
resource "aws_route_table_association" "private_db_1a" {
  route_table_id = aws_route_table.rtb_subnet_app_private_1a.id
  subnet_id      = aws_subnet.private_db_1a.id
}

output "subnet_private_db_1a_id" { value = aws_subnet.private_db_1a.id }
output "subnet_private_db_1a_cidr" { value = aws_subnet.private_db_1a.cidr_block }
output "subnet_private_db_1a_arn" { value = aws_subnet.private_db_1a.arn }
output "subnet_private_db_1a_az" { value = aws_subnet.private_db_1a.availability_zone }

resource "aws_subnet" "private_db_1c" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${local.region}c"
  cidr_block        = cidrsubnet(local.cidr_block, 8, 6)
  tags = merge(
    local.tags,
    { Name = "${local.project_name}/${local.environment}/private_db_1c" }
  )
}
resource "aws_route_table_association" "private_db_1c" {
  route_table_id = aws_route_table.rtb_subnet_app_private_1c.id
  subnet_id      = aws_subnet.private_db_1c.id
}
output "subnet_private_db_1c_id" { value = aws_subnet.private_db_1c.id }
output "subnet_private_db_1c_cidr" { value = aws_subnet.private_db_1c.cidr_block }
output "subnet_private_db_1c_arn" { value = aws_subnet.private_db_1c.arn }
output "subnet_private_db_1c_az" { value = aws_subnet.private_db_1c.availability_zone }