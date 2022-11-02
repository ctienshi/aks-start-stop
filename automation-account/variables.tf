variable "automation_name" {
  type        = string
  description = "Name of Automation account"
}

variable "automation_resource_group" {
  type        = string
  description = "Target resource group name"
}

variable "automation_location" {
  type        = string
  description = "Target location"
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
}

variable "subscription_id" {
  type = string
}
