# Issues:
# https://github.com/terraform-providers/terraform-provider-azurerm/issues/2918
# azurerm_subnet_network_security_group_association getting removed on re-applying changes

resource "azurerm_network_security_group" "nsg" {
  name                  = var.nsg_name
  resource_group_name   = var.resource_group_name
  location              = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                  = var.vnet_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  address_space         = ["10.0.0.0/16"]
  tags                  = var.tags

}

resource "azurerm_subnet" "subnet_prod" {
  name                      = format("%s-prod",var.subnet_name)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 0)
  lifecycle { 
     ignore_changes = [network_security_group_id]
 }
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-prod" {
  subnet_id                 = azurerm_subnet.subnet_prod.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet" "subnet_stage" {
  name                      = format("%s-stage",var.subnet_name)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 1)
  lifecycle { 
     ignore_changes = [network_security_group_id]
 }
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-stage" {
  subnet_id                 = azurerm_subnet.subnet_stage.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet" "subnet_dev" {
  name                      = format("%s-dev",var.subnet_name)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 2)
  lifecycle { 
     ignore_changes = [network_security_group_id]
 }
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-dev" {
  subnet_id                 = azurerm_subnet.subnet_dev.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "ip" {
  name                  = var.public_ip_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  allocation_method     = var.public_ip_allocation_method
  domain_name_label     = var.public_ip_dns_label
  tags                  = var.tags
}