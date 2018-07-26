module Prod.UsEast1.Prod.Consul exposing (main)

import Terraform.AWS as AWS
import Terramake exposing (..)
import Consul

main =
    exportAsTfvars
    <| withTerragrunt { source = "git::git@github.com:karandit/terramake-modules-example.git//consul?ref=v0.0.3" }
    <| Consul.consul Consul.withConsulDefaults
    <| {
      aws_region = AWS.US_East_1
      , cluster_name = "consul-prod"
      , num_servers = 3
      , num_clients = 6
      }
