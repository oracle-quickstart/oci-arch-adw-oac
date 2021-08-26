## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_streaming_stream" "test_stream" {
  depends_on         = [oci_identity_policy.StreamingDataSciencePolicies]
  name               = var.stream_name
  partitions         = var.stream_partitions
  retention_in_hours = var.stream_retention_in_hours
  stream_pool_id     = oci_streaming_stream_pool.test_stream_pool.id
  defined_tags       = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

}
