# Azure Resource Group
resource "azurerm_resource_group" "myrg" {

    for_each = {
        webapp1 = "eastus"
        webapp2 = "eastus2"
        webapp3 = "eastus2"
    }

    name = "${each.key}-rg"
    location = each.value
  
}