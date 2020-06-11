resource "oci_streaming_stream" "test_stream" {
    name = var.stream_name
    partitions = var.stream_partitions

 #   compartment_id = var.compartment_ocid
    retention_in_hours = var.stream_retention_in_hours
    stream_pool_id = oci_streaming_stream_pool.test_stream_pool.id
}
