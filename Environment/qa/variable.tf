variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string), {})
  }))
  default = {}
}

variable "vnet" {
  type = map(object({
    vnet-name                      = string
    vnet-location                  = string
    resource_group_name            = string
    address_space                  = list(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string, "Disabled")
    tags                           = optional(map(string))
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))

    encryption = optional(object({
      enforcement = string
    }))

    subnet = optional(list(object({
      snet-name                         = string
      address_prefixes                  = list(string)
      security_group                    = optional(string)
      default_outbound_access_enabled   = optional(bool, true)
      private_endpoint_network_policies = optional(string, "Disabled")
      service_endpoints                 = optional(list(string))
      delegation = optional(list(object({
        delegation-name = string
        service_delegation = object({
          service_delegation-name = string
          actions                 = list(string)
        })
      })), [])
    })), [])
  }))
  default = {}
}

variable "vms" {
  type = map(object({
    nic-name                        = string
    nic-location                    = string
    resource_group_name             = string
    subnet_name                     = string
    vnet_name                       = string
    nsg-name                        = string
    nsg-location                    = string
    vm-name                         = string
    kv_name                         = string
    kvs_name                        = string
    vm-location                     = string
    size                            = string
    script_name                     = string
    admin_username                  = optional(string)
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool, true)
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
  default = {}
}

variable "pip" {
  type = map(object({
    public_ip_name      = string
    resource_group_name = string
    location            = string
  }))
  default = {}
}

variable "bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_name      = string
    vnet_name           = string
    snet_name           = string
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "ilbs" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    frontend_ip_configuration = object({
      name                          = string
      private_ip_address_allocation = optional(string, "Dynamic")
      private_ip_address            = optional(string)
    })
    subnet_name       = string
    vnet_name         = string
    backend_pool_name = string
    probe_name        = string
    probe_port        = number
    probe_protocol    = optional(string, "Tcp")
    rule_name         = string
    rule_protocol     = optional(string, "Tcp")
    rule_port         = number
    backend_port      = number
  }))
  default = {}
}

variable "niclb" {
  type = map(object({
    ip_configuration_name = string
    nic_name              = string
    resource_group_name   = string
    lb_name               = string
    pool_name             = string
  }))
  default = {}
}

variable "appgws" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    gateway_ip_configuration_name  = string
    subnet_name                    = string
    vnet_name                      = string
    frontend_port_name             = string
    frontend_port                  = number
    frontend_ip_configuration_name = string
    public_ip_name                 = string

    backend_address_pool_name  = string
    nic1_name                  = string
    nic2_name                  = string
    backend_http_settings_name = string
    cookie_based_affinity      = string
    path                       = string
    port                       = number
    protocol                   = string
    request_timeout            = number

    http_listener_name        = string
    listener_protocol         = string
    request_routing_rule_name = string
    rule_type                 = string
    priority                  = number
  }))
  default = {}
}

variable "databases" {
  type = map(object({
    server_name         = string
    resource_group_name = string
    location            = string
    version             = string
    kv_name             = string
    kvs_name            = string
    administrator_login = string
    database_name       = string
    sku_name            = string
    collation           = optional(string)
    max_size_gb         = number
  }))
  default = {}
}

variable "nat_gateways" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    public_ip_name          = optional(string)
    vnet_name               = optional(string)
    subnet_name             = optional(string)
    sku_name                = optional(string, "Standard")
    idle_timeout_in_minutes = optional(number, 4)
    tags                    = optional(map(string), {})
  }))
  default = {}
}
