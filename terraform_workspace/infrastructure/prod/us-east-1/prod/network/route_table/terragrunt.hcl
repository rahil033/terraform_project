include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/route_table"
}

dependency "vpc" {
    config_path = "../vpc"
}

dependency "subnet" {
    config_path = "../subnet"
}

dependency "igw" {
    config_path = "../igw"
}

inputs = {
    vpc_id                  = dependency.vpc.outputs.vpc_id
    public_subnets_id       = dependency.subnet.outputs.public_subnets
    aws_internet_gateway    = dependency.igw.outputs.igw_id
    availability_zones      = ["us-east-1a", "us-east-1b"]
    public_route_table_tags         = {
        Name    = "terraform-public-rt"
        Env     = "Prod"
    }
}