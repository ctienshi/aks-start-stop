variable "automation_runbook_name" {
  type        = string
  description = "Name of Automation runbook"
}

variable "automation_account_name" {
  type        = string
  description = "Name of Automation account"
}

variable "runbook_type" {
  type        = string
  description = "Type of RunBook"
}

variable "custom_file_name" {
  type        = string
  description = "Name of runtime file"
}

variable "automation_runbook_resource_group" {
  type        = string
  description = "Target resource group name"
}

variable "automation_runbook_location" {
  type        = string
  description = "Target location"
}

variable "subscription_id" {
  type = string
}

variable "log_verbose" {
  type    = string
  default = "true"
}

variable "log_progress" {
  type    = string
  default = "true"
}

