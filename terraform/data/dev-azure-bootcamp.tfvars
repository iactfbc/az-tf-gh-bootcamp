resource_groups = {
  "tfstate" = {
    location = "westus2"
  }
}

bc_vnet_name = "rh-bc-vnet"
bc_vnet_cidr = "10.76.0.0/16"
bc_bastion_name = "AzureBastionSubnet"
bc_bastion_address_space = "10.76.1.0/24"
bc_bastion_pip_name = "bc_bastion_pip"
bc_bastion_host_name = "bcBastion"
bc_bastion_host_ipconfig = "bcConfiguration"