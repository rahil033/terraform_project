resource "aws_vpc_peering_connection_accepter" "this" {
  vpc_peering_connection_id = var.id
  auto_accept               = true
  tags = {
      Name = var.name
  }
}