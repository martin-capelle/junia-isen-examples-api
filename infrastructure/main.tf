provider "azurerm" {
  features {}
}

# Groupe de ressources
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Modules inclus
module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  app_service_name    = var.app_service_name
}

module "blob_storage" {
  source              = "./modules/blob_storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  blob_storage_name   = var.blob_storage_name
}

module "database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  database_name = var.database_name 
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
}
