output "automation_account_name" {
  value       = azurerm_automation_account.automation_account.name
  description = "Name of automation account."
}

output "automation_account_resource_group" {
  value       = azurerm_automation_account.automation_account.resource_group_name
  description = "Resource group of automation account."
}

output "automation_schedule_name" {
  value       = azurerm_automation_schedule.automation_schedule.*.name
  description = "Resource group of automation account."
}

output "automation_identity_id" {
  value       = azurerm_automation_account.automation_account.identity[0].principal_id
  description = "Object ID of the managed identity"
}
