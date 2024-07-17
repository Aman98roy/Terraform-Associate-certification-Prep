resource "azurerm_resource_group" "myrg" {
  #name     = var.resource_group_name
  name = "${var.business_unit}-${var.environment}"
  location = var.resource_group_location
}