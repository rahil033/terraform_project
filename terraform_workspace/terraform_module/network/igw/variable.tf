variable "vpc_id" {
  description = "List of VPC ID"
  type        = string
}

variable "igw" {
  description = "Additional tags for the Internet Gateway"
  type        = map(string)
}