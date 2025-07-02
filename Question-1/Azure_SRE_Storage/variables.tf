variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "West Europe"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
}

variable "storage_account_name" {
  type        = string
  description = "Azure Storage Account Name"
}

variable "storage_container_name" {
  type        = string
  description = "Azure Storage Container Name"
}

variable "container_access_type" {
  type        = string
  description = "Container access level (private/public/etc.)"
  default     = "private"
}
