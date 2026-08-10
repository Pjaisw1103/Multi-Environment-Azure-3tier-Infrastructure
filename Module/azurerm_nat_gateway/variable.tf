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
