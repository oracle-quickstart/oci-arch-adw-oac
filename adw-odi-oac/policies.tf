## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_identity_dynamic_group" "odi_dynamic_group" {
    provider = oci.homeregion
    name = "odi_dynamic_group"
    description = "odi_dynamic_group"
    compartment_id = var.tenancy_ocid
    matching_rule = "ALL {instance.compartment.id = '${var.compartment_ocid}'}"
}

resource "oci_identity_policy" "odi_policy" {
  provider = oci.homeregion
  depends_on = [oci_identity_dynamic_group.odi_dynamic_group]
  name = "odi_policy"
  description = "odi_policy"
  compartment_id = var.compartment_ocid
  statements = ["allow dynamic-group ${oci_identity_dynamic_group.odi_dynamic_group.name} to inspect autonomous-database-family in compartment id ${var.compartment_ocid}",
  "allow dynamic-group ${oci_identity_dynamic_group.odi_dynamic_group.name} to read autonomous-database-family in compartment id ${var.compartment_ocid}",
  "allow dynamic-group ${oci_identity_dynamic_group.odi_dynamic_group.name} to inspect compartments in compartment id ${var.compartment_ocid}"]
}
