resource_groups                     = "bc-tf-deploy"
bc_location                         = "westus2"
bc_vnet_name                        = "rh-bc-vnet"
bc_vnet_cidr                        = "10.76.0.0/16"
bc_bastion_name                     = "AzureBastionSubnet"
bc_bastion_address_space            = "10.76.1.0/24"
bc_bastion_pip_name                 = "bc_bastion_pip"
bc_bastion_host_name                = "bcBastion"
bc_bastion_host_ipconfig            = "bcConfiguration"
bc_storage_account_name             = "rhbctfsa"
bc_priv_endpoint_subnet_name        = "bcPrivEndpointSubnet"
bc_priv_endpoint_subnet_address     = "10.76.10.0/24"
bc_priv_endpoint                    = "bcPe"
bc_priv_dns_zone_group_name         = "bc_storage_account_dns_zone"
bc_priv_dns_zone_vnet_link_name     = "bc-sa-pe-link"
bc_vm_name                          = "bc-win16-vm"
bc_vm_username                      = "xadmin"
bc_vm_password                      = "1qaz2wsx!QAZ@WSX"
bc_vm_subnet_name                   = "servers"
bc_vm_subnet_address                = "10.76.20.0/24"