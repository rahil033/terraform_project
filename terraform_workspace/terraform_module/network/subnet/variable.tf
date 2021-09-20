variable "availability_zones" {
  description = "Availability zones for VPC"
  type        =  list(any)
}

variable "vpc_id" {
  description = "List of VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        =  list(any)
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(any)
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
}