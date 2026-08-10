data "azurerm_public_ip" "nat_pip" {
  for_each            = { for k, v in var.nat_gateways : k => v if v.public_ip_name != null }
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "nat_subnet" {
  for_each             = { for k, v in var.nat_gateways : k => v if v.subnet_name != null && v.vnet_name != null }
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}
