## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "bastion" {
  source              = "github.com/oracle-quickstart/oci-oracle-data-integrator/modules/bastion"
  #source              = "github.com/lfeldman/oci-oracle-data-integrator/modules/bastion"
  enabled             = var.create_public_subnet ? false : true
  compartment_id      = var.compartment_ocid
  region              = var.region
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  display_name_prefix = local.resource_name_prefix
  ssh_authorized_keys = tls_private_key.runtime_access.public_key_openssh
  subnet_id           = module.network.bastion_subnet_id
}