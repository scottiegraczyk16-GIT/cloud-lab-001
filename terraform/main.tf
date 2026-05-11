provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "cloud-lab-rg"
  location = "East US"
}
