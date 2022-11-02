resource "azurerm_automation_account" "automation_account" {
  name                = var.automation_name
  location            = var.automation_location
  resource_group_name = var.automation_resource_group
  identity {
    type = "SystemAssigned"
  }
  sku_name = "Basic"

  tags = var.tags
}