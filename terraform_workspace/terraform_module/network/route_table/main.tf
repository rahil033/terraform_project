resource "aws_route_table" "public_rt" {
    #count                  = length(var.availability_zones)
    vpc_id                 = var.vpc_id
    tags                   = var.public_route_table_tags
}

resource "aws_route" "public_route" {
    #count                  = length(var.availability_zones)
    #route_table_id         = element(aws_route_table.public_rt.id, count.index)
    route_table_id         =  aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = var.aws_internet_gateway
}

resource "aws_route_table_association" "public" {
    count                  = length(var.availability_zones)
    subnet_id              = element(var.public_subnets_id, count.index)
    route_table_id         = element(aws_route_table.public_rt.*.id, count.index)
}