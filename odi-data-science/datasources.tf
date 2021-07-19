## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Get list of availability domains

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Gets ObjectStorage namespace
data "oci_objectstorage_namespace" "user_namespace" {
  compartment_id = var.compartment_ocid
}

data "oci_identity_regions" "oci_regions" {
  
  filter {
    name = "name" 
    values = [var.region]
  }

}

data "oci_identity_tenancy" "oci_tenancy" {
    tenancy_id = var.tenancy_ocid
}

data "oci_identity_region_subscriptions" "home_region_subscriptions" {
    tenancy_id = var.tenancy_ocid

    filter {
      name   = "is_home_region"
      values = [true]
    }
}

data "oci_core_services" "oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}