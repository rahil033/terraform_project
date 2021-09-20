resource "aws_network_acl" "public" {
  vpc_id                 = var.vpc_id
  subnet_ids             = var.public_subnets_id
  tags                   = var.public_acl_tags
}

resource "aws_network_acl_rule" "public_inbound" {
  count                  = length(var.public_inbound_acl_rules)
  network_acl_id         = aws_network_acl.public.id
  egress                 = false
  rule_number            = var.public_inbound_acl_rules[count.index]["rule_number"]
  rule_action            = var.public_inbound_acl_rules[count.index]["rule_action"]
  from_port              = lookup(var.public_inbound_acl_rules[count.index], "from_port", null)
  to_port                = lookup(var.public_inbound_acl_rules[count.index], "to_port", null)
  protocol               = var.public_inbound_acl_rules[count.index]["protocol"]
  cidr_block             = lookup(var.public_inbound_acl_rules[count.index], "cidr_block", null)
}

resource "aws_network_acl_rule" "public_outbound" {
  count                  = length(var.public_outbound_acl_rules)
  network_acl_id         = aws_network_acl.public.id
  egress          = true
  rule_number     = var.public_outbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.public_outbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.public_outbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.public_outbound_acl_rules[count.index], "to_port", null)
  protocol        = var.public_outbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.public_outbound_acl_rules[count.index], "cidr_block", null)
}