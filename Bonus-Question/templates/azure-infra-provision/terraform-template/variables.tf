variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group Name"
}

variable "resource_group_tag" {
  type        = map(string)
  description = "Tags for resource group"
  default     = {
    department = "SRE"
  }
}

variable "storage_account_name" {
  type        = string
  description = "Azure Storage Account Name"
}

variable "storage_account_resource_group" {
  type        = string
  description = "Resource group for storage account"
  default     = "sre-challenge-flaschenpost"
}

variable "sku" {
  type        = string
  description = "Storage Account SKU"
  default     = "Standard_LRS"
}

variable "access_tier" {
  type        = string
  description = "Access Tier"
  default     = "Hot"
}

variable "storage_account_tag" {
  type        = map(string)
  description = "Tags for storage account"
  default     = {
    department = "SRE"
  }
}

variable "container_name" {
  type        = string
  description = "Storage container name"
  default     = "sre"
}

variable "container_type" {
  type        = string
  description = "Container type"
  default     = "private"
}

