variable "name" {
  description = "Desired name for the VPC Peering resources."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the requester VPC."
  type        = string
}

variable "accepter_vpc_id" {
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
  type        = string
}

variable "accepter_region" {
  description = "The region of the VPC with which you are creating the VPC Peering Connection."
  type        = string
  default     = null
}

variable "accepter_account_id" {
  description = "The AWS account ID of the owner of the peer VPC."
  type        = string
  default     = null
}