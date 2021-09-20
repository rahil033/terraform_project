output "public_network_acl_id" {
  description = "ID of the public network ACL"
  value       = aws_network_acl.public.*.id
}