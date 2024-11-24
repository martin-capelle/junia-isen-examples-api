resource "azurerm_storage_account" "main" {
  name                     = var.blob_storage_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "main" {
  name                  = "blob-container"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
