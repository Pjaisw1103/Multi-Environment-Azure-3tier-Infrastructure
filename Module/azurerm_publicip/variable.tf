variable "pip" {
  type = map(object({
    public_ip_name      = string
    resource_group_name = string
    location            = string
  }))
}