variable "id" {
  description = "The VPC Peering Connection ID to manage."
  type        = string
}

variable "name" {
  description = "Desired name for the VPC Peering resources."
  type        = string
  default     = ""
}