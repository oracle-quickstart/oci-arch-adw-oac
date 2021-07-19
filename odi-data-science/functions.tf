## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_functions_application" "DecoderApp" {
  compartment_id = var.compartment_ocid
  display_name   = "DecoderApp"
  subnet_ids     = [oci_core_subnet.app_subnet.id]
}

resource "oci_functions_function" "Decoder" {
  depends_on      = [null_resource.DecoderPush2OCIR]
  application_id  = oci_functions_application.DecoderApp.id
  display_name    = "Decoder"
  image           = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/decoder:latest"
  memory_in_mbs   = "256" 
}

