output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public_rt.*.id
}