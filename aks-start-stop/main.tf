module "aks-start-stop-automation-account" {
  source                           = "../automation-account"
  automation_name                  = var.automation_account_name
  automation_location              = var.location
  automation_resource_group        = var.automation_account_resource_group
  subscription_id                  = var.subscription_id
  tags                             = var.tags

  identity = {
    type = "SystemAssigned"
  }
}

module "aks-start-stop-automation-account-role-assignment" {
  source                        = "../../platform/modules/az-role-assignment"
  managed_identity_principal_id = module.aks-start-stop-automation-account.automation_identity_id
  role_assignments = [
    {
      scope                = var.k8s_cluster_id
      role_definition_name = "Contributor"
    }
  ]
}

module "aks-start-schedule" {
  source                    = "../automation-schedule"
  automation_schedule_name  = "aks-start-schedule"
  automation_resource_group = var.automation_account_resource_group
  automation_account_name   = var.automation_account_name
  frequency                 = var.start_frequency
  interval                  = var.start_interval
  time_zone                 = var.start_timezone
  start_time                = var.start_time
  week_days                 = var.start_days
  subscription_id           = var.subscription_id
}

module "aks-stop-schedule" {
  source                    = "../automation-schedule"
  automation_schedule_name  = "aks-stop-schedule"
  automation_resource_group = var.automation_account_resource_group
  automation_account_name   = var.automation_account_name
  frequency                 = var.stop_frequency
  interval                  = var.stop_interval
  time_zone                 = var.stop_timezone
  start_time                = var.stop_time
  week_days                 = var.stop_days
  subscription_id           = var.subscription_id
}

module "aks-start-stop-runbook" {
  source                            = "../automation-runbook"
  automation_runbook_name           = var.automation_runbook_name
  automation_runbook_location       = var.location
  automation_runbook_resource_group = var.automation_account_resource_group
  automation_account_name           = var.automation_account_name
  log_verbose                       = "false"
  log_progress                      = "false"
  description                       = "AKS start/stop automation runbook"
  runbook_type                      = "PowerShell"
  tags                              = var.tags
  provision_job_schedule            = false
  job_schedule_name                 = var.automation_schedule_name
  job_schedule_resource_group       = var.automation_account_resource_group
  subscription_id                   = var.subscription_id
  custom_file_name                  = "${path.module}/aks-start-stop.ps1"

  providers = {
    azurerm.common = azurerm.common
  }

  depends_on = [
    module.aks-start-stop-automation-account
  ]
}

module "aks-stop-job-schedule" {
  source                      = "../automation-job-schedule"
  job_schedule_resource_group = var.automation_account_resource_group
  automation_account_name     = module.aks-start-stop-automation-account.automation_account_name
  job_schedule_name           = module.aks-stop-schedule.automation_schedule_name
  automation_runbook_name     = var.automation_runbook_name
  subscription_id             = var.subscription_id
  parameters = {
    aksresourcegroup = var.automation_account_resource_group
    aksname          = var.aks_cluster_name
    subscriptionid   = var.subscription_id
    action           = "stop"
  }
}

module "aks-start-job-schedule" {
  source                      = "../automation-job-schedule"
  job_schedule_resource_group = var.automation_account_resource_group
  automation_account_name     = module.aks-start-stop-automation-account.automation_account_name
  job_schedule_name           = module.aks-start-schedule.automation_schedule_name
  automation_runbook_name     = var.automation_runbook_name
  subscription_id             = var.subscription_id
  parameters = {
    aksresourcegroup = var.automation_account_resource_group
    aksname          = var.aks_cluster_name
    subscriptionid   = var.subscription_id
    action           = "start"
  }
}
