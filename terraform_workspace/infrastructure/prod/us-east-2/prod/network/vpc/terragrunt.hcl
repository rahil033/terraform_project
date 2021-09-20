include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/vpc"
}

inputs = {
    cidr_block       = "192.168.0.0/16"
    instance_tenancy = "default"
    vpc_tags         = {
        Name    = "vpc-east"
        Env     = "Prod"
    }
}