variable "availability_zones" {
  description = "List of availability zones"
  type        =  list(any)
}

variable "vpc_id" {
  description = "List of VPC ID"
  type        = string
}

variable "public_subnets_id" {
  description = "ID of public subnets"
  type        = list(string)
}

variable "public_acl_tags" {
  description = "Additional tags for the public route table"
  type        = map(string)
}

variable "ingress_rules" {
  description = "A map of ingress rules in a network ACL. Use the key of map as the rule number."
  type        = map(map(any))
  default     = {}
}

variable "public_inbound_acl_rules" {
  description = "Public subnets inbound network ACLs"
  type        = list(map(string))
  default     = []
}
variable "public_outbound_acl_rules" {
  description = "Public subnets outbound network ACLs"
  type        = list(map(string))
  default     = []
}