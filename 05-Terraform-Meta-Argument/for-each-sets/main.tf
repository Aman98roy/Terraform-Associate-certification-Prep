# Terraform Block
terraform {
  required_version = ">= 1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.111.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
}