# locals {
#   vpc_peering_connection_id_temp = concat(aws_vpc_peering_connection.connection.id, list(var.vpc_peering_connection_id))
#   vpc_peering_connection_id      = element(local.vpc_peering_connection_id_temp, 0)
# }
resource "aws_vpc_peering_connection" "pc" {
  vpc_id        = var.this_vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_region   = var.peer_region
  auto_accept   = false
  tags = {
    Name = "vpc-east-2 to vpc-east-1 VPC peering"
  }
}

resource "aws_vpc_peering_connection_options" "requester" {
  vpc_peering_connection_id = aws_vpc_peering_connection.pc.id

  requester {
    allow_remote_vpc_dns_resolution  = true
    allow_classic_link_to_remote_vpc = false
    allow_vpc_to_remote_classic_link = false
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
    # vpc_peering_connection_id_temp = concat(aws_vpc_peering_connection.pc.*.id, list(var.vpc_peering_connection_id))
    vpc_peering_connection_id = aws_vpc_peering_connection.pc.id
    auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "accepter" {
    vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter.id

  accepter {
    allow_remote_vpc_dns_resolution  = true
    allow_classic_link_to_remote_vpc = false
    allow_vpc_to_remote_classic_link = false
  }
}

# resource "aws_route" "vpc-peering-route-east" {
#   count                     = 2
#   route_table_id            = module.vpc-east.public_route_table_ids[0]
#   destination_cidr_block    = module.vpc-west.public_subnets_cidr_blocks[count.index]
#   vpc_peering_connection_id = aws_vpc_peering_connection.pc.id
# }

# resource "aws_route" "vpc-peering-route-west" {
#   count                     = 2
#   route_table_id            = module.vpc-west.public_route_table_ids[0]
#   destination_cidr_block    = module.vpc-east.public_subnets_cidr_blocks[count.index]
#   vpc_peering_connection_id = aws_vpc_peering_connection.pc.id
# }