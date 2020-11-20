## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

## Random suffix to make things unique
resource "random_string" "instance_uuid" {
  length  = 8
  lower   = true
  upper   = false
  special = false
  number  = true
}