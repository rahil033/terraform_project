variable "availability_zones" {
  description = "List of availability zones"
  type        =  list(any)
}

variable "vpc_id" {
  description = "List of VPC ID"
  type        = string
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route table"
  type        = map(string)
}

variable "aws_internet_gateway" {
  description = "ID of internet gateway"
  type        = string
}

variable "public_subnets_id" {
  description = "ID of public subnets"
  type        = list(string)
}