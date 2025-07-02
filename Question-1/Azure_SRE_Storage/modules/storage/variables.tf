variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "storage_account_name" {
  type = string
}

variable "storage_container_name" {
  type = string
}

variable "container_access_type" {
  type    = string
  default = "private"
}
