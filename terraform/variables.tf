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