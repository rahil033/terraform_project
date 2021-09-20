include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/sg"
}

dependency "vpc" {
    config_path = "../vpc"
}

inputs = {
    vpc_id                  = dependency.vpc.outputs.vpc_id
    name                    = "sgweb"
    description             = "sg web"
    ingress_rules = {
      ingress = {
        description = "incoming for http"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
      }
    egress_rules = {
      egress = {
        description = "all traffic for http"
        from_port   =  0
        to_port     =  0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
      }
}