## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_dataflow_application" "test_application" {
  depends_on = [oci_identity_policy.StreamingDataSciencePolicies]
  #Required
  compartment_id = var.compartment_ocid
  display_name   = var.application_display_name
  driver_shape   = var.application_driver_shape
  executor_shape = var.application_executor_shape
  file_uri       = var.application_file_uri
  language       = var.application_language
  num_executors  = var.application_num_executors
  spark_version  = var.application_spark_version
  class_name     = var.application_class_name
  defined_tags   = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}
