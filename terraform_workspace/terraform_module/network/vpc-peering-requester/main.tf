resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.vpc_id
  auto_accept = false
  peer_vpc_id   = var.accepter_vpc_id
  peer_region   = var.accepter_region
  peer_owner_id = var.accepter_account_id
  tags = {
      Name = var.name
  }
}