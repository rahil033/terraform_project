include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/nacl"
}

dependency "vpc" {
    config_path = "../vpc"
}

dependency "subnet" {
    config_path = "../subnet"
}

inputs = {
    vpc_id                  = dependency.vpc.outputs.vpc_id
    public_subnets_id       = dependency.subnet.outputs.public_subnets
    availability_zones      = ["us-east-1a", "us-east-1b"]
    public_acl_tags         = {
        Name    = "terraform-public-nacl"
        Env     = "Prod"
    }
    public_inbound_acl_rules = [
        {
            rule_number             = "100"
            rule_action             = "allow"
            from_port               =  0
            to_port                 =  0
            protocol                = "-1"
            cidr_block              = "0.0.0.0/0"
    }
    ]
    public_outbound_acl_rules = [
        {
            rule_number             = "100"
            rule_action             = "allow"
            from_port               =  0
            to_port                 =  0
            protocol                = "-1"
            cidr_block              = "0.0.0.0/0"
    }
    ]
}