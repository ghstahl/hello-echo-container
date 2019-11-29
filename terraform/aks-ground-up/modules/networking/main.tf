resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet_prod" {
  name                 = format("%s-prod",var.subnet_name)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 0)
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-prod" {
  subnet_id                 = azurerm_subnet.subnet_prod.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet" "subnet_stage" {
  name                 = format("%s-stage",var.subnet_name)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 1)
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-stage" {
  subnet_id                 = azurerm_subnet.subnet_stage.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet" "subnet_dev" {
  name                 = format("%s-dev",var.subnet_name)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  # Taking the second /24 subnet from the first IP range of the virtual network
  address_prefix            = cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 2)
}

resource "azurerm_subnet_network_security_group_association" "nsga-subnet-dev" {
  subnet_id                 = azurerm_subnet.subnet_dev.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}