variable "subnet_count" {
  description = "The number of subnets to create gateways in, must match length of subnet_ids"
  type        = string
}

variable "vpc_id" {
  description = "The number of subnets to create gateways in, must match length of subnet_ids"
  type        = string
}

variable "public_subnets_id" {
  description = "A list of subnets to create gateways in"
  type        =  list(string)
}

variable "private_subnets_id" {
  description = "ID of private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        =  list(any)
}