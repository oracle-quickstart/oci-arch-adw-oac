## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_objectstorage_bucket" "dataflow_logs_bucket" {
    #Required
    compartment_id = var.tenancy_ocid
    name = var.dataflow_logs_bucket_name
    namespace = var.bucket_namespace

    #Optional
    access_type = var.bucket_access_type
    storage_tier = var.bucket_storage_tier
    versioning = var.bucket_versioning
}


resource "oci_dataflow_application" "test_application" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = var.application_display_name
    driver_shape = var.application_driver_shape
    executor_shape = var.application_executor_shape
    file_uri = var.application_file_uri
    language = var.application_language
    num_executors = var.application_num_executors
    spark_version = var.application_spark_version
    class_name = var.application_class_name
}
