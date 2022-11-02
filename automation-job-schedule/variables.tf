variable "automation_runbook_name" {
  type        = string
  description = "Name of Automation runbook"
}

variable "automation_account_name" {
  type        = string
  description = "Name of Automation account"
}

variable "job_schedule_resource_group" {
  type        = string
  description = "Target resource group name for job schedule"
}

variable "job_schedule_name" {
  type        = string
  description = "Name of job schedule"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "parameters" {
  type        = map(any)
  description = "Parameters for the runbook"
  default     = null
}
