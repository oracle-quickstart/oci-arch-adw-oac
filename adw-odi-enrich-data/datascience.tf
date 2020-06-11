## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
resource "oci_datascience_project" "test_project" {
    #Required
    compartment_id = var.compartment_ocid

    description = var.project_description
    display_name = var.project_display_name
}

resource "oci_datascience_notebook_session" "test_notebook_session" {
    #Required
    compartment_id = var.compartment_ocid
    notebook_session_configuration_details {
        #Required
        shape = var.notebook_session_notebook_session_configuration_details_shape
        subnet_id = oci_core_subnet.app_subnet.id

        #Optional
        block_storage_size_in_gbs = var.notebook_session_notebook_session_configuration_details_block_storage_size_in_gbs
    }
    project_id = oci_datascience_project.test_project.id

    display_name = var.notebook_session_display_name
}