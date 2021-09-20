variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the vpc where security group created"
  type        = string
}

variable "ingress_rules" {
    type      = map(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        #security_groups = list(string)
    }))
}

variable "egress_rules" {
    type      = map(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
}