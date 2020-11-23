## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

// General settings
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "region" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}

variable "service_name" {
  default = ""
}

variable "advanced_mode" {
  default = false
}

variable "runtime_mode" {
  default = "production"
}

variable "quick_create" {
  default = true
}

variable "use_marketplace_image" {
  default = true
}

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaat7fdtoicx5x34ofrcckfoimlrjb4tly5pgm3qfoyqssp2qnvsl6q"
}

variable "mp_listing_resource_version" {
  default = "ODI_Marketplace_V12.2.1.4.200721a"
}

variable "mp_listing_resource_id" {
  description = "Target image id"
  default = "ocid1.image.oc1..aaaaaaaa6khjykwya7brreppxvtiuifnolxmmgufcfbtwvugtui5kjjzz4sa"
}

variable "instance_shape" {
  default = "VM.Standard2.16"
}

variable "vcn_cidr" {
  default = "10.1.0.0/16"
}

variable "create_public_subnet" {
  default = true
}

variable "odi_vnc_password" {
}

#variable "subnet" {
#  default = ""
#}

#variable "subnetCompartment" {
#  default = ""
#}

#variable "vcn" {
#  default = ""
#}

#variable "vcnCompartment" {
#  default = ""
#}

#variable "assign_public_ip" {
#  default = false
#}

#variable "odi_repo" {
#  default = ""
#}

#variable "adw_instance" {
#  default = "adwctry1"
#}

#variable "adw_password" {
#  default = ""
#}

#variable "odi_password" {
#  default = ""
#}

#variable "odi_schema_prefix" {
#  default = ""
#}

#variable "odi_schema_password" {
#  default = ""
#}

#variable "new_adw_instance" {
#  default = ""
#}


#variable "new_adw_password" {
#  default = ""
#}

variable "new_odi_password" {
  default = ""
}

variable "new_odi_schema_prefix" {
  default = "odi"
}

variable "new_odi_schema_password" {
  default = ""
}

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
  default = false 
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = "1"
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

# Variables for OAC

variable "analytics_instance_capacity_capacity_type" {
  default = "OLPU_COUNT"
}

variable "analytics_instance_capacity_capacity_value" {
  default = 1
}

variable "analytics_instance_feature_set" {
  default = "ENTERPRISE_ANALYTICS"
}

variable "analytics_instance_license_type" {
  default = "LICENSE_INCLUDED"
}

variable "analytics_instance_name" {
  default = "OAC"
}

variable "analytics_instance_idcs_access_token" {}

#Data Catalog variables 

variable "catalog_display_name" {
  default = "My_Data_Catalog"
}
