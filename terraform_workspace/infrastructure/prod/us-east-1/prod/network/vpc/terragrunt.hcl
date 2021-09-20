include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/vpc"
}

inputs = {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    vpc_tags         = {
        Name    = "terraform-vpc"
        Env     = "Prod"
    }
}