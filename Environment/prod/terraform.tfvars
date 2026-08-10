rgs = {
  rg1 = {
    name     = "rg-prod-eastus"
    location = "East US"
    tags = {
      environment = "prod"
      project     = "multi-env-setup"
    }
  }
}

vnet = {
  vnet1 = {
    vnet-name           = "vnet-prod-eastus"
    vnet-location       = "East US"
    resource_group_name = "rg-prod-eastus"
    address_space       = ["10.2.0.0/16"]
    subnet = [
      {
        snet-name        = "snet-prod-frontend"
        address_prefixes = ["10.2.1.0/24"]
      },
      {
        snet-name        = "snet-prod-backend"
        address_prefixes = ["10.2.2.0/24"]
      },
      {
        snet-name        = "AzureBastionSubnet"
        address_prefixes = ["10.2.3.0/24"]
      },
      {
        snet-name        = "snet-prod-appgw"
        address_prefixes = ["10.2.4.0/24"]
      }
    ]
  }
}

pip = {
  pip_nat = {
    public_ip_name      = "pip-nat-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
  }
  pip_bastion = {
    public_ip_name      = "pip-bastion-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
  }
  pip_appgw = {
    public_ip_name      = "pip-appgw-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
  }
}

nat_gateways = {
  nat1 = {
    name                = "nat-prod-eastus"
    location            = "East US"
    resource_group_name = "rg-prod-eastus"
    public_ip_name      = "pip-nat-prod-eastus"
    vnet_name           = "vnet-prod-eastus"
    subnet_name         = "snet-prod-backend"
    tags = {
      environment = "prod"
    }
  }
}

bastion = {
  bastion1 = {
    name                = "bastion-prod-eastus"
    location            = "East US"
    resource_group_name = "rg-prod-eastus"
    public_ip_name      = "pip-bastion-prod-eastus"
    vnet_name           = "vnet-prod-eastus"
    snet_name           = "AzureBastionSubnet"
    tags = {
      environment = "prod"
    }
  }
}

ilbs = {
  ilb1 = {
    name                = "ilb-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
    sku                 = "Standard"
    frontend_ip_configuration = {
      name                          = "ilb-frontend-ip"
      private_ip_address_allocation = "Dynamic"
    }
    subnet_name       = "snet-prod-backend"
    vnet_name         = "vnet-prod-eastus"
    backend_pool_name = "ilb-backend-pool"
    probe_name        = "ilb-health-probe"
    probe_port        = 80
    probe_protocol    = "Tcp"
    rule_name         = "ilb-http-rule"
    rule_protocol     = "Tcp"
    rule_port         = 80
    backend_port      = 80
  }
}

vms = {
  vm1 = {
    nic-name            = "nic-vm-prod-01"
    nic-location        = "East US"
    resource_group_name = "rg-prod-eastus"
    subnet_name         = "snet-prod-frontend"
    vnet_name           = "vnet-prod-eastus"
    nsg-name            = "nsg-vm-prod-01"
    nsg-location        = "East US"
    vm-name             = "vm-prod-web-01"
    vm-location         = "East US"
    kv_name             = "kv-prod-eastus"
    kvs_name            = "vm-admin-password"
    size                = "Standard_D2s_v3"
    script_name         = "install_nginx.sh"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

niclb = {
  niclb1 = {
    ip_configuration_name = "internal"
    nic_name              = "nic-vm-prod-01"
    resource_group_name   = "rg-prod-eastus"
    lb_name               = "ilb-prod-eastus"
    pool_name             = "ilb-backend-pool"
  }
}

appgws = {
  appgw1 = {
    name                = "appgw-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 2
    }
    gateway_ip_configuration_name  = "appgw-ip-config"
    subnet_name                    = "snet-prod-appgw"
    vnet_name                      = "vnet-prod-eastus"
    frontend_port_name             = "frontend-port-80"
    frontend_port                  = 80
    frontend_ip_configuration_name = "appgw-frontend-ip"
    public_ip_name                 = "pip-appgw-prod-eastus"
    backend_address_pool_name      = "appgw-backend-pool"
    nic1_name                      = "nic-vm-prod-01"
    nic2_name                      = "nic-vm-prod-01"
    backend_http_settings_name     = "appgw-http-settings"
    cookie_based_affinity          = "Disabled"
    path                           = "/"
    port                           = 80
    protocol                       = "Http"
    request_timeout                = 20
    http_listener_name             = "appgw-http-listener"
    listener_protocol              = "Http"
    request_routing_rule_name      = "appgw-routing-rule"
    rule_type                      = "Basic"
    priority                       = 100
  }
}

databases = {
  db1 = {
    server_name         = "sql-server-prod-eastus"
    resource_group_name = "rg-prod-eastus"
    location            = "East US"
    version             = "12.0"
    kv_name             = "kv-prod-eastus"
    kvs_name            = "sql-admin-password"
    administrator_login = "sqladmin"
    database_name       = "db-prod-app"
    sku_name            = "P1"
    max_size_gb         = 250
  }
}
