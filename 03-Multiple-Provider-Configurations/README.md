---
title: Terraform Multiple Provider Blocks on Azure Cloud
description: Learn how to use multiple Terraform provider blocks on Azure Cloud
---

# Multiple Provider Configurations

## Introduction
In Terraform, you can use multiple providers within the same configuration to manage resources across different cloud platforms or regions. This is particularly useful when your infrastructure spans multiple environments, requiring coordination across various providers. Configuring multiple providers allows you to define and manage resources from different sources in a single Terraform configuration, enhancing flexibility and control.

Key Points about Multiple Providers:
Flexibility: Manage resources from different providers within a single Terraform configuration.
Separation of Concerns: Use provider aliases to separate configurations for different environments or regions.
Interoperability: Combine resources from various providers to build comprehensive infrastructure solutions.

## How to define multiple provider configuration of same Provider?
- Understand about default provider
- Understand and define multiple provider configurations of same provider
```t
# Provider-1 for EastUS (Default Provider)
provider "azurerm" {
  features {}
}

# Provider-2 for WestUS Region
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
    }
  }
  alias = "provider2-westus"
  client_id = "XXXX"
  client_secret = "YYY"
  environment = "YYY"
  subscription_id = "YYY"
}
```

## How to reference the non-default provider configuration in a resource?
```t
# Provider-2: Create a resource group in WestUS region - Uses "provider2-westus" provider
resource "azurerm_resource_group" "myrg2" {
  name = "myrg-2"
  location = "West US"
    #<PROVIDER NAME>.<ALIAS NAME>
  provider = azurerm.provider2-westus
}
```
