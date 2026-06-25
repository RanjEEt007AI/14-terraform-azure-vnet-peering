
# Resource Group
resource "azurerm_resource_group" "ranjeet-rg" {
  name     = "ranjeet-rg-vnet-peering"
  location = "Central India"
}

# VNET 1
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
}

# VNET 2
resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2"
  address_space       = ["192.168.0.0/16"]
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
}

# VNET1 -> VNET2 Peering
resource "azurerm_virtual_network_peering" "peer1" {
  name                      = "vnet1-to-vnet2"
  resource_group_name       = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id

  allow_virtual_network_access = true
}

# VNET2 -> VNET1 Peering
resource "azurerm_virtual_network_peering" "peer2" {
  name                      = "vnet2-to-vnet1"
  resource_group_name       = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id

  allow_virtual_network_access = true
}