variable "location" {
  type        = string
  description = "Location of the Azure resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "app_service_name" {
  type        = string
  description = "Name of the App Service"
}

variable "blob_storage_name" {
  type        = string
  description = "Name of the Blob Storage account"
}

variable "database_name" {
  type        = string
  description = "Name of the database"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}
