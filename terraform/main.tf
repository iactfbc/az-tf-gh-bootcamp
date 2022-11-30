resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.key
  location = each.value.location
}


resource "azurerm_virtual_network" "bcvnet" {
  name                  = var.bc_vnet_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  address_space         = [var.bc_vnet_cidr]
}

resource "azurerm_public_ip" "bastionpip" {
  name                = var.bc_bastion_pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "bastionSubnet" {
  name                  = var.bc_bastion_name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  virtual_network_name  = azurerm_virtual_network.bcvnet.name
  address_prefixes      = var.bc_bastion_address_space
}

resource "azurerm_bastion_host" "bcBastionHost" {
  name                = var.bc_bastion_host_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = var.bc_bastion_host_ipconfig
    subnet_id            = azurerm_subnet.bastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
}