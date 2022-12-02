variable "resource_groups" {
  type = string
  description = "Bootcamp RG Name"
}

variable "bc_location" {
  type = string
  description = "Bootcamp resource region"
}

variable "bc_vnet_name" {
  type = string
  description = "Bootcamp vNet Name"
}

variable "bc_vnet_cidr" {
  type = string
  description = "Bootcamp vNet Address Space"
}

variable "bc_bastion_name" {
  type = string
  description = "Bootcamp Bastion Name"
}

variable "bc_bastion_address_space" {
  type = string
  description = "Bootcamp Bastion CIDR"
}

variable "bc_bastion_pip_name" {
  type = string
  description = "Bootcamp Bastion PIP Name"
}

variable "bc_bastion_host_name" {
  type = string
  description = "Bootcamp Bastion Host Name"
}

variable "bc_bastion_host_ipconfig" {
  type = string
  description = "Bootcamp Bastion Host IP Configuration"
}

variable "bc_storage_account_name" {
  type = string
  description = "Bootcamp Storage Account with PE"
}

variable "bc_priv_endpoint_subnet_name" {
  type = string
  description = "Bootcamp Storage Account Private Endpoint Name"
}

variable "bc_priv_endpoint_subnet_address" {
  type = string
  description = "Bootcamp Storage Account Private Endpoint CIDR"
}

variable "bc_priv_endpoint" {
  type = string
  description = "Bootcamp Private Endpoint"
}

variable "bc_priv_dns_zone_group_name" {
  type = string
  description = "Bootcamp Private DNS Zone Name"
}

variable "bc_priv_dns_zone_vnet_link_name" {
  type = string
  description = "Bootcamp Private DNS Zone vNet Link Name"
}

variable "bc_vm_name" {
  type = string
  description = "Bootcamp VM for SA access via PE"
}

variable "bc_vm_username" {
  type = string
  description = "Bootcamp VM Username"
}

variable "bc_vm_password" {
  type = string
  description = "Bootcamp VM Password"
}

variable "bc_vm_subnet_name" {
  type = string
  description = "Bootcamp VM Subnet Name"
}

variable "bc_vm_subnet_address" {
  type = string
  description = "Bootcamp VM Subnet CIDR"
}