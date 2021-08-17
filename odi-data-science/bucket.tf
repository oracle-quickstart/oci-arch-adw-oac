## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
resource "oci_objectstorage_bucket" "data_bucket" {
    #Required
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = data.oci_objectstorage_namespace.user_namespace.namespace

    #Optional
    access_type = var.bucket_access_type
    storage_tier = var.bucket_storage_tier
    versioning = var.bucket_versioning
}
