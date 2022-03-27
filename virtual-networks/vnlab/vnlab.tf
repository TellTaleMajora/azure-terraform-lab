terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
    backend "azurerm" {
        resource_group_name  = "rglab"
        storage_account_name = "stlabylt3i"
        container_name       = "tfstate"
        key                  = "virtual-networks/vnlab/terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_network_security_group" "nsglab" {
  name                = "nsblab"
  location            = "North Central US"
  resource_group_name = "rglab"
}

resource "azurerm_virtual_network" "vnetlab" {
  name                = "vnetlab"
  location            = "North Central US"
  resource_group_name = "rglab"
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    env = "lab"
  }
}