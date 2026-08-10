resource "azurerm_network_interface_backend_address_pool_association" "niclb" {
  for_each                = var.niclb
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.pool[each.key].id
}