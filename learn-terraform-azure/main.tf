# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "learnterraformtest"
    workspaces {
      name = "learn-terraform-azure"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "canadacentral"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "Devops"
  }
}


# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "canadacentral"
  resource_group_name = azurerm_resource_group.rg.name
}
