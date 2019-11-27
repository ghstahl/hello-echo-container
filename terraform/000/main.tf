terraform {
  backend "azurerm" {
    storage_account_name  = "stterraformtstate15861"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "state-p7-secure" {
  name     = "rg-p7"
  location = "eastus2"
}