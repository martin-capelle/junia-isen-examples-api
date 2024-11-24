resource "azurerm_postgresql_flexible_server" "main" {
  name                = var.database_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B_Standard_B1ms"
  storage_mb          = 32768
  version             = "13"
  administrator_login = "adminuser"
  administrator_password = "StrongPassword123!" # Replace with a sensitive variable

  zone = "1" # Définissez la zone (par exemple : "1", "2" ou "3")
  public_network_access_enabled = true
}
