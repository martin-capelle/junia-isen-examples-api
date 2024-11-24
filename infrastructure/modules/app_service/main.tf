resource "azurerm_service_plan" "main" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"         
  sku_name            = "B1"           
}



resource "azurerm_app_service" "main" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.main.id
}
