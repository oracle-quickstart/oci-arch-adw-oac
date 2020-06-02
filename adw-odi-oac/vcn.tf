## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Create VCN

resource "oci_core_virtual_network" "vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "analytics-vcn"
  dns_label      = "tfexamplevcn"
}

data "oci_core_services" "test_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}


# Create NAT gateway to allow one way outbound internet traffic

resource "oci_core_nat_gateway" "ng" {
  compartment_id = var.compartment_ocid
  display_name   = "nat-gateway"
  vcn_id         = oci_core_virtual_network.vcn.id
}

# Create Service gateway to allow database server access to object storage bucket for backups

resource "oci_core_service_gateway" "sg" {
  compartment_id = var.compartment_ocid
  services {
    service_id = data.oci_core_services.test_services.services.0.id
  }
  display_name   = "service-gateway"
  vcn_id         = oci_core_virtual_network.vcn.id
}


# Create route table to connect vcn to internet gateway

resource "oci_core_route_table" "dbrt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "db-rt-table"
  route_rules {
    destination       = lookup(data.oci_core_services.test_services.services[0], "cidr_block")
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.sg.id
  }
}


# Create security list to associate with database server subnet

resource "oci_core_security_list" "dbsl" {
  compartment_id = var.compartment_ocid
  display_name   = "db-security-list"
  vcn_id         = oci_core_virtual_network.vcn.id

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }


  ingress_security_rules {
    protocol = "6"
    source   = "10.0.0.0/24"

    tcp_options {
      max = 22
      min = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "10.0.0.0/24"

    tcp_options {
      max = 1521
      min = 1521
    }
  }
}

resource "oci_core_subnet" "db_subnet" {
  cidr_block        = "10.0.1.0/24"
  display_name      = "db-subnet"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.dbrt.id
  security_list_ids = [oci_core_security_list.dbsl.id]
  prohibit_public_ip_on_vnic = true
  dns_label         = "subnet2"
  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_network_security_group" "dbnsg" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "Database Security Group"
}

#Ingress

resource "oci_core_network_security_group_security_rule" "db_in" {
  network_security_group_id = oci_core_network_security_group.dbnsg.id

  description = "Database Listener Port"
  direction   = "INGRESS"
  protocol    = 6
  source_type = "CIDR_BLOCK"
  source      = "10.0.0.0/24"
  tcp_options {
    destination_port_range {
      min = 1522
      max = 1522
    }
  }
}
#Egress
resource "oci_core_network_security_group_security_rule" "db_out" {
  network_security_group_id = oci_core_network_security_group.dbnsg.id

  description = "Outbound Database Traffic"
  direction   = "EGRESS"
  protocol    = 6
  destination_type = "CIDR_BLOCK"
  destination      = "10.0.0.0/24"

}

# Create route table to associate with ODI server subnet

resource "oci_core_route_table" "apprt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "app-rt-table"
  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.ng.id
  }
}

# Create security list to associate with the ODI server subnet

resource "oci_core_security_list" "appsl" {
  compartment_id = var.compartment_ocid
  display_name   = "app-security-list"
  vcn_id         = oci_core_virtual_network.vcn.id

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = 22
      min = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = 80
      min = 80
    }
  }
}

# Create regional subnet for ODI server in vcn

resource "oci_core_subnet" "app_subnet" {
  cidr_block        = "10.0.0.0/24"
  display_name      = "app-subnet"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.apprt.id
  security_list_ids = [oci_core_security_list.appsl.id]
  prohibit_public_ip_on_vnic = true
  dns_label         = "subnet1"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}