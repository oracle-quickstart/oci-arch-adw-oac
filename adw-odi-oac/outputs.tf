## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "odi_node_id" {
  value = module.odi.node_id
}
 
output "odi_node_public_ip" {
  value = module.odi.node_public_ip 
}

output "odi_node_private_ip" {
  value = module.odi.node_private_ip
}

output "bastion_host_id" {
  value = module.bastion.id
}

output "bastion_host_public_ip" {
  value = module.bastion.public_ip
}


output "public_vnc" {
  value = "${module.odi.node_public_ip}:1" 
}

output "private_vnc" {
  value = "${module.odi.node_private_ip}:1" 
}

#output "public_web_studio_url" {
#  value = "http://${module.odi.node_public_ip}:9999/odi-web-studio" 
#}

#output "private_web_studio_url" {
#  value = "http://${module.odi.node_private_ip}:9999/odi-web-studio" 
#}

output "ssh_private_key" {
  value = tls_private_key.runtime_access.private_key_pem
}