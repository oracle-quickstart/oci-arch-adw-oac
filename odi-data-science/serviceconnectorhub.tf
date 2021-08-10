resource "oci_sch_service_connector" "test_service_connector" {
    depends_on = [oci_identity_policy.ODIDataSciencePolicies]
    #Required
    compartment_id = var.compartment_ocid
    display_name = var.service_connector_display_name
    source {
        #Required
        kind = var.service_connector_source_kind

        #Optional
        cursor {

            #Optional
            kind = var.service_connector_source_cursor_kind
        }
        stream_id = oci_streaming_stream.test_stream.id
    }

    target {
        #Required
        kind = var.service_connector_target_kind

        #Optional
        batch_rollover_size_in_mbs = var.service_connector_target_batch_rollover_size_in_mbs
        batch_rollover_time_in_ms = var.service_connector_target_batch_rollover_time_in_ms
        bucket = var.service_connector_target_bucket
        compartment_id = var.compartment_ocid
        #enable_formatted_messaging = var.service_connector_target_enable_formatted_messaging
        namespace = data.oci_objectstorage_namespace.user_namespace.namespace
        object_name_prefix = var.service_connector_target_object_name_prefix
    }

    #Optional
    description = var.service_connector_description
    tasks {
        #Required
        kind = var.service_connector_tasks_kind

        #Optional
        batch_size_in_kbs = var.service_connector_tasks_batch_size_in_kbs
        batch_time_in_sec = var.service_connector_tasks_batch_time_in_sec
        #condition = var.service_connector_tasks_condition
        function_id = oci_functions_function.Decoder.id
    }

}