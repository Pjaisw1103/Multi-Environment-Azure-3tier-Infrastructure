module "azurerm_resource_group" {
  source = "../../Module/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Module/azurerm_virtual_network"
  vnet       = var.vnet
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source     = "../../Module/azurerm_virtual_machine"
  vms        = var.vms
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Module/azurerm_publicip"
  pip        = var.pip
}

module "azurerm_bastion" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_public_ip]
  source     = "../../Module/azurerm_bastion"
  bastion    = var.bastion
}

module "azurerm_internal_loadbalancer" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source     = "../../Module/azurerm_internal_loadbalancer"
  ilbs       = var.ilbs
}

module "azurerm_niclb_association" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_machine, module.azurerm_internal_loadbalancer]
  source     = "../../Module/azurerm_niclb_association"
  niclb      = var.niclb
}

module "azurerm_application_gateway" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_public_ip]
  source     = "../../Module/azurerm_application_gateway"
  appgws     = var.appgws
}

module "azurerm_database" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Module/azurerm_database"
  databases  = var.databases
}

module "azurerm_nat_gateway" {
  depends_on   = [module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_public_ip]
  source       = "../../Module/azurerm_nat_gateway"
  nat_gateways = var.nat_gateways
}