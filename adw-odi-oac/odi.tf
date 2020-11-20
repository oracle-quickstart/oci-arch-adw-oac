## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "odi" {
  depends_on = [oci_identity_policy.odi_policy, oci_database_autonomous_database.test_autonomous_database]
  source = "github.com/oracle-quickstart/oci-oracle-data-integrator/modules/odi"
#  source = "github.com/lfeldman/oci-oracle-data-integrator/modules/odi"
  compartment_id       = var.compartment_ocid
  region               = var.region
  availability_domain  = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  image_id             = var.mp_listing_resource_id
  display_name_prefix  = local.resource_name_prefix
  ssh_authorized_keys  = tls_private_key.runtime_access.public_key_openssh
  ssh_private_key      = tls_private_key.runtime_access.private_key_pem
  bastion_host         = var.create_public_subnet ? "" : module.bastion.public_ip
  node_hostname_prefix = "oracle-odi-inst"
  shape                = var.instance_shape
  subnet_id            = module.network.application_subnet_id 
#  subnet_id            = oci_core_subnet.app_subnet.id
  assign_public_ip     = false
  odi_vnc_password     = var.odi_vnc_password
  adw_instance         = oci_database_autonomous_database.test_autonomous_database.id
  adw_password         = var.autonomous_database_admin_password
  odi_password         = var.new_odi_password 
  odi_schema_prefix    = var.new_odi_schema_prefix 
  odi_schema_password  = var.new_odi_schema_password
  adw_creation_mode    = true
  embedded_db          = false 
  db_tech              = "ADB"
  studio_mode          = "ADVANCED"
}
