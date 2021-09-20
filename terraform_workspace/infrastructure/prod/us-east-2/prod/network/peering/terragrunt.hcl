include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/peering"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "vpc_peer_east" {
  config_path = "../../../../us-east-1/prod/network/vpc/"
}

inputs = {
  this_vpc_id = dependency.vpc.outputs.vpc_id
  peer_vpc_id = dependency.vpc_peer_east.outputs.vpc_id
  #vpc_peering_connection_id  = local.vpc_peering_connection_id
  peer_region = "us-east-1"
  auto_accept = "true"
}