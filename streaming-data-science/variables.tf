## Copyright © 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Variables

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

#Object Storage Bucket Variables

variable "bucket_name" {
  default = "data_bucket"
}


variable "bucket_access_type" {
  default = "NoPublicAccess"
}

variable "bucket_storage_tier" {
  default = "Standard"
}

variable "bucket_versioning" {
  default = "Disabled"
}


#Data Catalog variables 

variable "catalog_display_name" {
  default = "My_Data_Catalog"
}

#Data Science variables 

variable "project_description" {
  default = "Test_Project"
}

variable "project_display_name" {
  default = "My Data Science Project"
}

variable "notebook_session_display_name" {
  default = "Test Notebook Session"
}

variable "notebook_session_notebook_session_configuration_details_shape" {
  default = "VM.Standard2.1"
}

variable "notebook_session_notebook_session_configuration_details_block_storage_size_in_gbs" {
  default = "50"
}

#Streams variables 

variable "stream_pool_name" {
  default = "Test_Stream_Pool"
}
variable "stream_name" {
  default = "Test_Stream"
}

variable "stream_partitions" {
  default = "1"
}

variable "stream_retention_in_hours" {
  default = "24"
}

#variables for Data Flow Application
# The default values below are specific to the data flow tutorial for a Java application
# URL for the data flow tutorial https://docs.cloud.oracle.com/en-us/iaas/data-flow/tutorial/dfs_tut_etl_java_create.htm
# Modify the values below based on your specific application

variable "dataflow_logs_bucket_name" {
  default = "dataflow-logs"
}

variable "application_display_name" {
  default = "Test data flow app"
}

variable "application_driver_shape" {
  default = "VM.Standard2.1"
}

variable "application_executor_shape" {
  default = "VM.Standard2.1"
}

variable "application_file_uri" {
  default = "oci://oow_2019_dataflow_lab@bigdatadatasciencelarge/usercontent/oow-lab-2019-java-etl-1.0-SNAPSHOT.jar"
}

variable "application_language" {
  default = "Java"
}

variable "application_num_executors" {
  default = "1"
}

variable "application_spark_version" {
  default = "2.4.4"
}

variable "application_class_name" {
  default = "convert.Convert"
}

variable "application_description" {
  default = "Test Java Application"
}

# Functions/OCIR Variables

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.0"
}

variable "ocir_repo_name" {
  default = "decoder"
}

variable "ocir_user_name" {
  default = ""
}

variable "ocir_user_password" {
  default = ""
}

locals {
  ocir_docker_repository = join("", [lower(lookup(data.oci_identity_regions.oci_regions.regions[0], "key")), ".ocir.io"])
  ocir_namespace         = lookup(data.oci_identity_tenancy.oci_tenancy, "name")
}

#Service Connector Variables

variable "service_connector_display_name" {
  default = "Test_Service_Connector"
}

variable "service_connector_source_kind" {
  default = "streaming"
}

variable "service_connector_source_cursor_kind" {
  default = "TRIM_HORIZON"
}

variable "service_connector_target_kind" {
  default = "objectStorage"
}

variable "service_connector_target_bucket" {
  default = "data_bucket"
}

variable "service_connector_target_object_name_prefix" {
  default = "data"
}

variable "service_connector_target_batch_rollover_size_in_mbs" {
  default = 10
}

variable "service_connector_target_batch_rollover_time_in_ms" {
  default = 60000
}

variable "service_connector_description" {
  default = "Used to connect streaming to object storage"
}

variable "service_connector_tasks_kind" {
  default = "function"
}

variable "service_connector_tasks_batch_size_in_kbs" {
  default = 5120
}

variable "service_connector_tasks_batch_time_in_sec" {
  default = 60
}
