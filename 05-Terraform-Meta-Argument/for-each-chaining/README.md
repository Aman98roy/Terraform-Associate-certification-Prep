## Observe Linux Virtual Machine for_each Argument
- In `azurerm_linux_virtual_machine` resource we are using the `for_each` argument by referring to Network Interface Resource named `azurerm_network_interface.myvmnic`. This is called `for_each` chaining. 
```t
# for_each chaining
  for_each = azurerm_network_interface.myvmnic 
```

## Execute Terraform Commands
```t
# Terraform Init
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan
Observation: 
1) 2 Public IP, 2 Network Interface and 2 Linux VM Resources will be generated in plan
2) Review Resource Names ResourceType.ResourceLocalName[each.key]
3) Review Resource Names

# Terarform Apply
terraform apply
 
# Verify
1. Azure Resource Group
2. Azure Virtual Network
3. Azure Subnet
4. Azure Public IP - 2 Resources created as specified in count
5. Azure Network Interface - 2 Resources created as specified in count
6. Azure Linux Virtual Machine - - 2 Resources created as specified in count

# Access Application
http://<PUBLIC_IP-1>
http://<PUBLIC_IP-2>