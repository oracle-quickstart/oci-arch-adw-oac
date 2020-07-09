## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_dataintegration_workspace" "test_workspace" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = var.workspace_display_name

    #Optional
    description = var.workspace_description
    is_private_network_enabled = var.workspace_is_private_network_enabled
    subnet_id = oci_core_subnet.app_subnet.id
    vcn_id = oci_core_virtual_network.vcn.id
}
