module "test_route_table" {
  providers = {
    azurerm = azurerm.connectivity
  }
  source  = "Azure/avm-res-network-routetable/azurerm"
  version = "0.4.1"

  location            = "southeastasia"
  name                = "mainrt"
  resource_group_name = module.config.custom_replacements.connectivity_hub_primary_resource_group_name
  enable_telemetry    = false

  routes = {
    test-route-internet = {
      name                   = "test-route-internet"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.0.11"
    }
  }
  subnet_resource_ids = {
    subnet1 = "${module.hub_and_spoke_vnet[0].virtual_network_resource_ids["primary"]}/subnets/${module.config.custom_replacements.primary_subnet_nva_name}"
  }

  depends_on = [module.hub_and_spoke_vnet, module.config]
}


