resource "azurerm_automation_job_schedule" "automation_job_schedule" {
  resource_group_name     = var.job_schedule_resource_group
  automation_account_name = var.automation_account_name
  schedule_name           = var.job_schedule_name
  runbook_name            = var.automation_runbook_name
  parameters              = var.parameters
}
