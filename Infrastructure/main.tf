provider "azurerm" {
  features {}
}

resource "azurerm_ resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
