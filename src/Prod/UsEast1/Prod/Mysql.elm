module Prod.UsEast1.Prod.Mysql exposing (main)

import Terraform.AWS as AWS
import Terraform.AWS.RDS as RDS
import Terramake exposing (..)
import Mysql

main =
    exportAsTfvars
    <| withTerragrunt { source = "git::git@github.com:karandit/terramake-modules-example.git//mysql?ref=v0.0.3" }
    <| Mysql.mysql
    <| { aws_region = AWS.US_East_1
      , name           = "mysql_prod"
      , instance_class = RDS.Db_T2_medium
      , allocated_storage = 100
      , storage_type      = RDS.Standard
      , master_username = "admin"
      , master_password = "admin" --TODO: find a solution
      }
