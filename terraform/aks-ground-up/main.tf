resource "random_string" "suffix" {
  length  = 10
  upper   = false
  special = false
}

locals {
  resource_prefix              = "ground-up"
  resource_suffix              = "${random_string.suffix.result}"
  default_storage_account_name = "registry${local.resource_suffix}"
  storage_account_name         = "st${var.storage_account_name != "" ? var.storage_account_name : local.default_storage_account_name}"
  default_acr_name             = "${local.resource_suffix}"
  acr_name                     = "acr-${var.registry_name != "" ? var.registry_name : local.default_acr_name}"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.resource_group_name}"
  location = var.location
}

module "storage" {
  source               = "./modules/storage"
  storage_account_name = local.storage_account_name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_tier = var.storage_account_tier
}
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  nsg_name            = format("nsg-%s",local.resource_prefix)
  vnet_name           = format("vnet-%s",local.resource_prefix)
  subnet_name         = format("snet-%s",local.resource_prefix)
}