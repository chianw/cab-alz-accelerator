## to run plan 
```
terraform plan -var-file="/Users/jzwong/Library/CloudStorage/OneDrive-Microsoft/git/bca/alz-terraform-accelerator/templates/platform_landing_zone/examples/full-single-region-nva/hub-and-spoke-vnet.tfvars"
```

## subscription-ids are entered into terraform.tfvars.json file
```
{
  "hub_and_spoke_vnet_settings": {},
  "hub_and_spoke_vnet_virtual_networks": {},
  "root_parent_management_group_id": "",
  "starter_locations": [
    "southeastasia",
    "southeastasia"
  ],
  "subscription_id_connectivity": "68be2809-9674-447c-a43d-261ef2862c29",
  "subscription_id_identity": "c989d764-e476-48f3-a67b-95a7f09c8ee6",
  "subscription_id_management": "a28df86c-26bc-4340-895b-f7d83ae7a07b"
}
```

## there is a need to add subscription-id in provider azurerm in terraform.tf
```
provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = var.subscription_id_management
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
```

## Module call path
the primary hub object is defined in https://github.com/Azure/terraform-azurerm-avm-ptn-hubnetworking/blob/main/variables.tf#L12 
```
Azure/avm-ptn-alz-connectivity-hub-and-spoke-vnet/azurerm --> Azure/avm-ptn-hubnetworking/azurerm 

https://github.com/Azure/terraform-azurerm-avm-ptn-alz-connectivity-hub-and-spoke-vnet/blob/main/main.tf

https://github.com/Azure/terraform-azurerm-avm-ptn-hubnetworking/blob/main/variables.tf

```