resource "random_string" "suffix" {
  length  = 10
  upper   = false
  special = false
}

locals {
  environment                  = "prod"
  resource_prefix              = var.resource_prefix
  resource_suffix              = random_string.suffix.result
  default_storage_account_name = format("registry%s",local.resource_suffix)
  storage_account_name         = "st${var.storage_account_name != "" ? var.storage_account_name : local.default_storage_account_name}"
  default_acr_name             = "${local.resource_suffix}"
  acr_name                     = "acr${var.registry_name != "" ? var.registry_name : local.default_acr_name}"
  public_ip_dns_label          = var.public_ip_dns_label
  aks_dns_prefix               = format("aks-%s",var.resource_prefix)
   
}

data "azurerm_resource_group" "rg" {
  name     = format("rg-%s",var.resource_group_name)
}
data "azurerm_resource_group" "rg_network" {
  name     = format("rg-network-%s",var.resource_group_name)
}

data "azurerm_subnet" "subnet" {
  name                      = format("snet-%s-%s",local.resource_prefix,local.environment)
  resource_group_name       = data.azurerm_resource_group.rg_network.name
  virtual_network_name      = format("vnet-%s",local.resource_prefix)
}

module "kubernetes-cluster" {
  source              = "../../modules/kubernetes-cluster"
  name                = format("%s-%s",local.resource_prefix,local.environment)
  tags                = var.tags
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  subnet_id           = data.azurerm_subnet.subnet.id
  client_id           = var.client_id
  client_secret       = var.client_secret
  dns_prefix          = local.aks_dns_prefix
  admin_username      = var.admin_username
} 