resource "aws_eip" "natgw" {
  vpc           = true
}

resource "aws_nat_gateway" "natgw" {
  count = var.subnet_count
  allocation_id = element(aws_eip.natgw.*.id, count.index)
  subnet_id     = element(var.public_subnets_id, count.index)
  tags = {
    Name = "Nat-Gateway_Project"
  }
}

resource "aws_route_table" "nat_route" {
  count = var.subnet_count
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.natgw.*.id, count.index)
  }
  tags = {
    Name = "Route Table for NAT Gateway"
  }
}

resource "aws_route_table_association" "instance" {
  count                  = length(var.availability_zones)
  subnet_id              = element(var.private_subnets_id, count.index)
  route_table_id         = element(aws_route_table.nat_route.*.id, count.index)
}