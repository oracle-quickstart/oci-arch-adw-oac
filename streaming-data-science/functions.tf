## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_functions_application" "DecoderApp" {
  depends_on     = [oci_identity_policy.StreamingDataSciencePolicies]
  compartment_id = var.compartment_ocid
  display_name   = "DecoderApp"
  subnet_ids     = [oci_core_subnet.app_subnet.id]
  defined_tags   = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

}

resource "oci_functions_function" "Decoder" {
  depends_on     = [null_resource.DecoderPush2OCIR]
  application_id = oci_functions_application.DecoderApp.id
  display_name   = "DecoderFn"
  image          = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/decoder:0.0.50"
  memory_in_mbs  = "256"
  defined_tags   = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

}

