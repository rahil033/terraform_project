include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/igw"
}

dependency "vpc" {
    config_path = "../vpc"
}

inputs = {
    vpc_id                  = dependency.vpc.outputs.vpc_id
    igw         = {
        Name    = "terraform-igw"
        Env     = "Prod"
    }
}