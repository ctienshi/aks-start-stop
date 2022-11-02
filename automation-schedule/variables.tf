variable "automation_account_name" {
  type        = string
  description = "Name of Automation account"
}

variable "automation_resource_group" {
  type        = string
  description = "Target resource group name"
}

variable "automation_schedule_name" {
  type        = string
  description = "Name of Automation schedule"
}

variable "frequency" {
  type        = string
  description = "The frequency of the schedule"
  default     = "Month"
}

variable "interval" {
  type        = number
  description = "The number of frequencys between runs."
  default     = 1
}

variable "time_zone" {
  type        = string
  description = "The timezone of the start time."
  default     = "Europe/Helsinki"
}

variable "start_time" {
  type        = string
  description = "Start time of the schedule."
  default     = "2021-03-01T14:00:00Z"
}

variable "week_days" {
  type        = list(string)
  description = "List of days of the week that the job should execute on."
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}
