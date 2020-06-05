provider "azurerm" {
  version = "=1.44.0"

  subscription_id =   var.subscription_id
  client_id       =   var.client_id
  client_secret   =   var.client_secret
  tenant_id       =   var.tenant_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "XXXXXX"
    storage_account_name = "XXXXXX"
    container_name       = "XXXXXX"
    key                  = "XXXXXX"
    access_key           = "XXXXXX"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-Resources"
  location = var.location
}
resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "frontend" {
  name                 = "${var.prefix}-frontend"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
  address_prefix       = "10.0.1.0/24"
}
resource "azurerm_subnet" "backend" {
  name                 = "${var.prefix}-backend"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
  address_prefix       = "10.0.2.0/24"
}
resource "azurerm_subnet" "database" {
  name                 = "${var.prefix}-database"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
  address_prefix       = "10.0.3.0/24"
}
resource "azurerm_subnet" "security" {
  name                 = "${var.prefix}-security"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
  address_prefix       = "10.0.4.0/24"
}
