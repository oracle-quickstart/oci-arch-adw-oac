## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
resource "oci_datacatalog_catalog" "my_data_catalog" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = var.catalog_display_name
}
