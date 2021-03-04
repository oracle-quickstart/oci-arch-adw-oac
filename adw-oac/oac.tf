## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# This Terraform script provisions a OAC instance

# Create Analytics Instance

resource "oci_analytics_analytics_instance" "test_analytics_instance" {
    #Required
    compartment_id = var.compartment_ocid
    feature_set = var.analytics_instance_feature_set
    license_type = var.analytics_instance_license_type
    name = var.analytics_instance_name
    description = "OAC Instance"
    idcs_access_token = var.analytics_instance_idcs_access_token

    capacity {
        #Required
        capacity_type = var.analytics_instance_capacity_capacity_type
        capacity_value = var.analytics_instance_capacity_capacity_value
    }
    defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}
