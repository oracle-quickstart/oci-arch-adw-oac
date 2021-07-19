## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

provider "oci" {
  version              = ">= 3.0.0"
  tenancy_ocid         = var.tenancy_ocid
  region               = var.region
  disable_auto_retries = "true"
}

