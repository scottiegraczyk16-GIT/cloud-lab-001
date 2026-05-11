########################################
# Terraform + Providers
########################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}

provider "azurerm" {
  features {}
}

########################################
# Resource Group
########################################
resource "azurerm_resource_group" "rg" {
  name     = "cloud-lab-rg"
  location = "Central US"
}

########################################
# Virtual Network
########################################
resource "azurerm_virtual_network" "vnet" {
  name                = "cloudlab-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

########################################
# Azure propagation delay (IMPORTANT)
########################################
resource "time_sleep" "wait_for_vnet" {
  depends_on      = [azurerm_virtual_network.vnet]
  create_duration = "30s"
}

########################################
# Subnet
########################################
resource "azurerm_subnet" "subnet" {
  name                 = "cloudlab-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    time_sleep.wait_for_vnet
  ]
}

########################################
# Public IP (for SSH)
########################################
resource "azurerm_public_ip" "pip" {
  name                = "cloudlab-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

########################################
# Network Security Group (Allow SSH)
########################################
resource "azurerm_network_security_group" "nsg" {
  name                = "cloudlab-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}

########################################
# Network Interface
########################################
resource "azurerm_network_interface" "nic" {
  name                = "cloudlab-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

########################################
# Associate NSG to NIC
########################################
resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

########################################
# Linux Virtual Machine
########################################
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "cloudlab-linux-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/cloudlab_tf.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}