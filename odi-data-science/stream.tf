## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_streaming_stream" "test_stream" {
    depends_on = [oci_identity_policy.ODIDataSciencePolicies]
    name = var.stream_name
    partitions = var.stream_partitions

 #   compartment_id = var.compartment_ocid
    retention_in_hours = var.stream_retention_in_hours
    stream_pool_id = oci_streaming_stream_pool.test_stream_pool.id
}
