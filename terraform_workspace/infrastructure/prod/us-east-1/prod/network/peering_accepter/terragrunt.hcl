include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../../terraform_module//network/vpc-peering-accepter"
}

dependency "peer_id" {
  config_path = "../../../../us-east-2/prod/network/peering/"
}

inputs = {
  id               = dependency.peer_id.outputs.connection_id 
  name             = "my-peering-acceptor"
}