## lifecycle - prevent_destroy
- This meta-argument `prevent_destroy`, when set to true, will cause Terraform to reject with an error any plan that would destroy the infrastructure object associated with the resource, as long as the argument remains present in the configuration.
- This can be used as a measure of safety against the accidental replacement of objects that may be costly to reproduce, such as database instances
- However, it will make certain configuration changes impossible to apply, and will prevent the use of the `terraform destroy` command once such objects are created, and so this option should be used `sparingly`.
- Since this argument must be present in configuration for the protection to apply, note that this setting does not prevent the remote object from being destroyed if the resource block were removed from configuration entirely: in that case, the `prevent_destroy` setting is removed along with it, and so Terraform will allow the destroy operation to succeed.
```t
# Lifecycle Block
  lifecycle {
    prevent_destroy = true # Default is false
  }
```

- **Sample Output when we run destroy**
```log
d:\Terraform-Associate-certification-Prep\07-Terraform-Lifecycle\prevent-destroy>terraform destroy --auto-approve
azurerm_resource_group.myrg: Refreshing state... [id=/subscriptions/c3c80153-5dbe-4e98-8302-2df5618ac11c/resourceGroups/myrg-1]
azurerm_virtual_network.myvnet: Refreshing state... [id=/subscriptions/c3c80153-5dbe-4e98-8302-2df5618ac11c/resourceGroups/myrg-1/providers/Microsoft.Network/virtualNetworks/myvnet-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform planned the following actions, but then encountered a problem:

  # azurerm_virtual_network.myvnet will be destroyed
  - resource "azurerm_virtual_network" "myvnet" {
      - address_space           = [
          - "10.0.0.0/16",
        ] -> null
      - dns_servers             = [] -> null
      - flow_timeout_in_minutes = 0 -> null
      - guid                    = "df4448e9-bf37-43a6-b613-e1bc0fed9090" -> null
      - id                      = "/subscriptions/c3c80153-5dbe-4e98-8302-2df5618ac11c/resourceGroups/myrg-1/providers/Microsoft.Network/virtualNetworks/myvnet-1" -> null
      - location                = "eastus" -> null
      - name                    = "myvnet-1" -> null
      - resource_group_name     = "myrg-1" -> null
      - subnet                  = [] -> null
      - tags                    = {} -> null
        # (2 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 1 to destroy.
╷
│ Error: Instance cannot be destroyed
│
│   on prevent-destroy.tf line 8:
│    8: resource "azurerm_virtual_network" "myvnet" {
│
│ Resource azurerm_virtual_network.myvnet has lifecycle.prevent_destroy set, but the plan calls for this resource to be destroyed. To avoid this error and continue with the plan, either disable
│ lifecycle.prevent_destroy or reduce the scope of the plan using the -target option.
```