## Configure the vSphere Provider
provider "vsphere" {
    user = "${var.vsphere_user}"
    password = "${var.vsphere_password}"
    vsphere_server = "${var.vsphere_server}"
    allow_unverified_ssl = true
}

## Build VM
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "cloned_virtual_machine" {
  name             = "${var.vsphere_virtual_machine_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1 # Set the vCPU quantity
  memory   = 2 # Set the memory size (in GB) 
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  wait_for_guest_net_timeout = 0

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "vmxnet3" # Set the type of network adapter 
#   adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"  # In case you want to use the same network adapter as template 
  }

  disk {
    label = "disk0"
    size = 30 # Set the disk size (in GB)
    thin_provisioned = true
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

## Customize VM clone
    customize {
      linux_options {
        host_name = var.vm_hostname
        domain    = var.vm_domain
      }

      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = var.vm_netmask
      }

      ipv4_gateway = var.vm_gateway
    }
  }
}
