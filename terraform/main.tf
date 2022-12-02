resource "azurerm_resource_group" "rg" {
  name                      = var.resource_groups
  location                  = var.bc_location
}


resource "azurerm_virtual_network" "bcvnet" {
  name                      = var.bc_vnet_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  address_space             = [var.bc_vnet_cidr]
}

resource "azurerm_public_ip" "bastionpip" {
  name                      = var.bc_bastion_pip_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  allocation_method         = "Static"
  sku                       = "Standard"

  tags = {
    environment             = "Production"
  }
}

resource "azurerm_subnet" "bastionSubnet" {
  name                      = var.bc_bastion_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.bcvnet.name
  address_prefixes          = [var.bc_bastion_address_space]
}

resource "azurerm_bastion_host" "bcBastionHost" {
  name                      = var.bc_bastion_host_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name

  ip_configuration {
    name                    = var.bc_bastion_host_ipconfig
    subnet_id               = azurerm_subnet.bastionSubnet.id
    public_ip_address_id    = azurerm_public_ip.bastionpip.id
  }
}

resource "azurerm_storage_account" "bcsa" {
  name                      = var.bc_storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"

  tags = {
    environment             = "staging"
  }
}

resource "azurerm_subnet" "bcprivendpoint" {
  name                      = var.bc_priv_endpoint_subnet_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.bcvnet.name
  address_prefixes          = [var.bc_priv_endpoint_subnet_address]

  enforce_private_link_service_network_policies = true
}

resource "azurerm_private_endpoint" "bcpe" {
  name                      = "${azurerm_storage_account.bcsa.name}-pe"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = azurerm_subnet.bcprivendpoint.id

  private_service_connection {
    name                           = var.bc_priv_dns_zone_group_name
    private_connection_resource_id = azurerm_storage_account.bcsa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]  
  }
}

resource "azurerm_subnet" "bcserversubnet" {
  name                        = var.bc_vm_subnet_name
  resouresource_group_name    = azurerm_resource_group.rg.name
  virtualvirtual_network_name = azurerm_virtual_network.bcvnet.name
  address_prefixes            = [var.bc_vm_subnet_address]   
}


resource "azurerm_network_interface" "bcvmnic" {
  name                = "${bc_vm_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.bcserversubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "bcvm" {
  name                = var.bc_vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = var.bc_vm_username
  admin_password      = var.bc
  network_interface_ids = [
    azurerm_network_interface.bcvmnic.id,
  ]

  os_disk {
    name                 = "${var.bc_vm_name}-OSDisk"                 
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}