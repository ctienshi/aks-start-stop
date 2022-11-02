resource "azurerm_automation_schedule" "automation_schedule" {
  name                    = var.automation_schedule_name
  resource_group_name     = var.automation_resource_group
  automation_account_name = var.automation_account_name
  frequency               = var.frequency
  interval                = var.interval
  timezone                = var.time_zone
  start_time              = var.start_time
  description             = "Schedule for running runtime"
  week_days               = var.week_days
}
