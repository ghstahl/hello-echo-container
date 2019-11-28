terraform {
  backend "azurerm" {
    # Due to a limitation in backend objects, variables cannot be passed in.
    # Do not declare an access_key here. Instead, export the
    # ARM_ACCESS_KEY environment variable.

    storage_account_name  = "stterraformtstate1483"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.az_resource_group_name
  location = var.az_resource_group_location
}