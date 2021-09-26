include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/vpc-peering-requester"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "vpc_peer_east" {
  config_path = "../../../../us-east-1/prod/network/vpc/"
}

inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  accepter_vpc_id     = dependency.vpc_peer_east.outputs.vpc_id
  accepter_region     = "us-east-1"
  accepter_account_id = "626865948728"
  name                = "my-peering-connection"
}