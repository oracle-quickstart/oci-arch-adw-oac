## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


locals {
  generated_name_prefix       = format("odi_%s", random_string.instance_uuid.result)
  generated_dns_label         = format("odi%s", random_string.instance_uuid.result)
  generated_rcu_schema_prefix = format("ODI%s", upper(random_string.instance_uuid.result))
  resource_name_prefix        = var.service_name != "" ? var.service_name : local.generated_name_prefix
}



