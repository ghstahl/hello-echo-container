resource "random_string" "suffix" {
  length  = 10
  upper   = false
  special = false
}

locals {
  resource_prefix              = var.resource_prefix
  resource_suffix              = random_string.suffix.result
  default_storage_account_name = format("registry%s",local.resource_suffix)
  storage_account_name         = "st${var.storage_account_name != "" ? var.storage_account_name : local.default_storage_account_name}"
  default_acr_name             = "${local.resource_suffix}"
  acr_name                     = "acr${var.registry_name != "" ? var.registry_name : local.default_acr_name}"
  public_ip_dns_label          = var.public_ip_dns_label
   
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s",var.resource_group_name)
  location = var.location
  tags     = var.tags
}
resource "azurerm_resource_group" "rg_network" {
  name     = format("rg-network-%s",var.resource_group_name)
  location = var.location
  tags     = var.tags
}

 
module "networking" {
  source              = "../../modules/networking"
  tags                = var.network_tags
  resource_group_name = azurerm_resource_group.rg_network.name
  location            = azurerm_resource_group.rg_network.location
  public_ip_name      = format("pip-%s",local.resource_prefix)
  public_ip_dns_label = local.public_ip_dns_label
  nsg_name            = format("nsg-%s",local.resource_prefix)
  vnet_name           = format("vnet-%s",local.resource_prefix)
  subnet_name         = format("snet-%s",local.resource_prefix)
} 
module "storage" {
  source               = "../../modules/storage"
  tags                 = var.tags
  storage_account_name = local.storage_account_name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_tier = var.storage_account_tier
}
module "acr" {
  source              = "../../modules/acr"
  tags                = var.tags
  registry_name       = local.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}