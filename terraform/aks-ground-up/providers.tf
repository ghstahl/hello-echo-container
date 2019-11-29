provider "azurerm" {
  # Preventing automatic upgrades to new versions that may contain breaking changes.
  # Any non-beta version >= 1.25.0 and < 2.0.0
  version = "~>1.37"
}

provider "random" {
  version = "~>2.1"
}

provider "template" {
  version = "~>2.1"
}

terraform {
  required_version = ">= 0.12.16"
    backend "azurerm" {
    # Due to a limitation in backend objects, variables cannot be passed in.
    # Do not declare an access_key here. Instead, export the
    # ARM_ACCESS_KEY environment variable.

    storage_account_name  = "stterraformtstate7335"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

