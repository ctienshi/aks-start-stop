variable "automation_account_name" {
  type        = string
  description = "Resource name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
}

variable "automation_schedule_name" {
  type        = string
  description = "Name of Automation schedule"
}

variable "k8s_cluster_id" {
  type        = string
  description = "Cluster ID of the dev environment"
}

variable "automation_runbook_name" {
  type        = string
  description = "Name of Automation runbook"
}

variable "automation_account_resource_group" {
  type        = string
  description = "Name of the resource group"
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name to start and stop"
}

# AKS start configurations
variable "start_frequency" {
  type        = string
  description = "The frequency of the schedule"
  default     = "Week"
}

variable "start_interval" {
  type        = number
  description = "The number of frequencys between runs."
  default     = 1
}

variable "start_timezone" {
  type        = string
  description = "The timezone of the start time."
  default     = "Europe/Helsinki"
}

variable "start_time" {
  type        = string
  description = "Start time of the schedule."
}

variable "start_days" {
  type        = list(string)
  description = "List of days of the week that the job should execute on."
  default     = ["Monday"]
}

# AKS stop configurations
variable "stop_frequency" {
  type        = string
  description = "The frequency of the schedule"
  default     = "Week"
}

variable "stop_interval" {
  type        = number
  description = "The number of frequencys between runs."
  default     = 1
}

variable "stop_timezone" {
  type        = string
  description = "The timezone of the start time."
  default     = "Europe/Helsinki"
}

variable "stop_time" {
  type        = string
  description = "Start time of the schedule."
}

variable "stop_days" {
  type        = list(string)
  description = "List of days of the week that the job should execute on."
  default     = ["Friday"]
}
