## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "network" {
  source                = "github.com/oracle-quickstart/oci-oracle-data-integrator/modules/network"
  display_name_prefix   = local.resource_name_prefix
  compartment_id        = var.compartment_ocid
  vcn_cidr              = var.vcn_cidr
  dns_label             = local.generated_dns_label
  create_private_subnet = true
  network_enabled       = true
}