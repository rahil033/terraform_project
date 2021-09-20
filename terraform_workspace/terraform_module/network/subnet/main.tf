resource "aws_subnet" "public_subnets" {
  count                           = length(var.availability_zones)
  vpc_id                          = var.vpc_id
  cidr_block                      = element(var.public_subnets, count.index)
  availability_zone               = element(var.availability_zones, count.index)
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  tags                            = var.public_subnet_tags
}

resource "aws_subnet" "private_subnets" {
  count                           = length(var.availability_zones)
  vpc_id                          = var.vpc_id
  cidr_block                      = element(var.private_subnets, count.index)
  availability_zone               = element(var.availability_zones, count.index)
  tags                            = var.private_subnet_tags
}