include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/subnet"
}

dependency "vpc" {
    config_path = "../vpc"
}

inputs = {
    vpc_id                  = dependency.vpc.outputs.vpc_id
    public_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets         = ["10.0.3.0/24", "10.0.4.0/24"]
    availability_zones      = ["us-east-1a", "us-east-1b"]
    map_public_ip_on_launch = "true"
    public_subnet_tags         = {
        Name    = "terraform-public-subnet"
        Env     = "Prod"
    }
    private_subnet_tags        = {
        Name    = "terraform-private-subnet"
        Env     = "Prod"
    }   
}