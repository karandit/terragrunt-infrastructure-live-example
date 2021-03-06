module Prod.UsEast1.Prod.WebserverCluster exposing (main)

import Terraform.AWS as AWS
import Terraform.AWS.EC2 as EC2
import Terramake exposing (..)
import AsgElb

main =
    exportAsTfvars
    <| withTerragrunt { source = "git::git@github.com:karandit/terramake-modules-example.git//asg-elb-service?ref=v0.0.3" }
    <| AsgElb.asgElb
    <| {aws_region          = AWS.US_East_1
      , name                = "webserver-example-prod"
      , instance_type       = EC2.T2_medium
      , min_size            = 3
      , max_size            = 3
      , server_port         = 8080
      , elb_port            = 80
      }
