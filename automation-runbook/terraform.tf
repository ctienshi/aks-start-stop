terraform {

  required_providers {

    azurerm = {
      version               = "= 3.27.0"
      source                = "hashicorp/azurerm"
      configuration_aliases = [azurerm.common]
    }
  }

  backend "azurerm" {
  }
}
