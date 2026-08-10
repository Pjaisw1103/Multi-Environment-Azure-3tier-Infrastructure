data "azurerm_subnet" "appgw_subnet" {
  for_each             = var.appgws
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.appgws
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic1" {
  for_each            = var.appgws
  name                = each.value.nic1_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic2" {
  for_each            = var.appgws
  name                = each.value.nic2_name
  resource_group_name = each.value.resource_group_name
}


