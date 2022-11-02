data "local_file" "custom_file" {
  filename = var.custom_file_name
}

resource "azurerm_automation_runbook" "automation_runbook" {
  name                    = var.automation_runbook_name
  location                = var.automation_runbook_location
  resource_group_name     = var.automation_runbook_resource_group
  automation_account_name = var.automation_account_name
  log_verbose             = var.log_verbose
  log_progress            = var.log_progress
  description             = var.description
  runbook_type            = var.runbook_type
  tags                    = var.tags

  content = data.local_file.custom_file.content
}
