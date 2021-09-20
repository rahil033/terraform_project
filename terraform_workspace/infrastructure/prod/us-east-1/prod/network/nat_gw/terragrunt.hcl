include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/nat_gw"
}

dependency "vpc" {
    config_path = "../vpc"
}

dependency "subnet" {
    config_path = "../subnet"
}

inputs = {
    subnet_count            =  1
    public_subnets_id       = dependency.subnet.outputs.public_subnets
    vpc_id                  = dependency.vpc.outputs.vpc_id
    private_subnets_id      = dependency.subnet.outputs.private_subnets
    availability_zones      = ["us-east-1a", "us-east-1b"]
}