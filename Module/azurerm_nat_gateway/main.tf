resource "azurerm_nat_gateway" "nat" {
  for_each                = var.nat_gateways
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = lookup(each.value, "sku_name", "Standard")
  idle_timeout_in_minutes = lookup(each.value, "idle_timeout_in_minutes", 4)
  tags                    = lookup(each.value, "tags", {})
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
  for_each             = { for k, v in var.nat_gateways : k => v if v.public_ip_name != null }
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.nat_pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  for_each       = { for k, v in var.nat_gateways : k => v if v.subnet_name != null && v.vnet_name != null }
  subnet_id      = data.azurerm_subnet.nat_subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}
