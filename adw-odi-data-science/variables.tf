## Copyright © 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Variables
variable "tenancy_ocid" {
}

variable "compartment_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}

variable "region" {
}

variable "ssh_public_key" {
}

variable "ssh_private_key" {
}

# Specify any Default Value's here

#variable "availability_domain" {
#  default = "3"
#}

variable "ad_number" {
  default     = 0
  description = "Which availability domain to deploy to depending on quota, zero based."
}

variable "ad_name" {
  default = ""
}

#Variables for Autonomous Data Warehouse

variable "autonomous_database_cpu_core_count" {
  default = "1"
}

variable "autonomous_database_admin_password" {
}

variable "autonomous_database_db_name" {
  default = "aTFdb"
}

variable "autonomous_database_display_name" {
  default = "My ATP DB"
}

variable "autonomous_database_db_version" {
  default = "19c"
}

variable "autonomous_database_is_auto_scaling_enabled" {
  default = "false"
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = "1"
}

variable "autonomous_database_db_workload" {
  default = "DW"
}

variable "autonomous_database_license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "autonomous_database_data_safe_status" {
  default = "NOT_REGISTERED"
}

variable "autonomous_database_whitelisted_ips" {
  default = ["240.0.0.0/4"]
}

# OAC Variables

variable "analytics_instance_capacity_capacity_type" {}

variable "analytics_instance_capacity_capacity_value" {}

variable "analytics_instance_feature_set" {}

variable "analytics_instance_license_type" {}

variable "analytics_instance_name" {}

variable "analytics_instance_idcs_access_token" {}

#Object Storage Bucket Variables

variable "bucket_name" {
  default = "data_bucket"
}
   
variable "bucket_namespace" {
}


variable "bucket_access_type" {
  default ="NoPublicAccess"
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

# Variables for Data Integration Service
variable "workspace_display_name" {
  default = "Test_DI_Workspace"
}

variable "workspace_description" {
  default = "Test DI workspace"
}

variable "workspace_is_private_network_enabled" {
  default = true
}