rgs = {
  rg1 = {
    name     = "rg-qa-eastus"
    location = "East US"
    tags = {
      environment = "qa"
      project     = "multi-env-setup"
    }
  }
}

vnet = {
  vnet1 = {
    vnet-name           = "vnet-qa-eastus"
    vnet-location       = "East US"
    resource_group_name = "rg-qa-eastus"
    address_space       = ["10.1.0.0/16"]
    subnet = [
      {
        snet-name        = "snet-qa-frontend"
        address_prefixes = ["10.1.1.0/24"]
      },
      {
        snet-name        = "snet-qa-backend"
        address_prefixes = ["10.1.2.0/24"]
      },
      {
        snet-name        = "AzureBastionSubnet"
        address_prefixes = ["10.1.3.0/24"]
      },
      {
        snet-name        = "snet-qa-appgw"
        address_prefixes = ["10.1.4.0/24"]
      }
    ]
  }
}

pip = {
  pip_nat = {
    public_ip_name      = "pip-nat-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
  }
  pip_bastion = {
    public_ip_name      = "pip-bastion-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
  }
  pip_appgw = {
    public_ip_name      = "pip-appgw-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
  }
}

nat_gateways = {
  nat1 = {
    name                = "nat-qa-eastus"
    location            = "East US"
    resource_group_name = "rg-qa-eastus"
    public_ip_name      = "pip-nat-qa-eastus"
    vnet_name           = "vnet-qa-eastus"
    subnet_name         = "snet-qa-backend"
    tags = {
      environment = "qa"
    }
  }
}

bastion = {
  bastion1 = {
    name                = "bastion-qa-eastus"
    location            = "East US"
    resource_group_name = "rg-qa-eastus"
    public_ip_name      = "pip-bastion-qa-eastus"
    vnet_name           = "vnet-qa-eastus"
    snet_name           = "AzureBastionSubnet"
    tags = {
      environment = "qa"
    }
  }
}

ilbs = {
  ilb1 = {
    name                = "ilb-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
    sku                 = "Standard"
    frontend_ip_configuration = {
      name                          = "ilb-frontend-ip"
      private_ip_address_allocation = "Dynamic"
    }
    subnet_name       = "snet-qa-backend"
    vnet_name         = "vnet-qa-eastus"
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
    nic-name            = "nic-vm-qa-01"
    nic-location        = "East US"
    resource_group_name = "rg-qa-eastus"
    subnet_name         = "snet-qa-frontend"
    vnet_name           = "vnet-qa-eastus"
    nsg-name            = "nsg-vm-qa-01"
    nsg-location        = "East US"
    vm-name             = "vm-qa-web-01"
    vm-location         = "East US"
    kv_name             = "kv-qa-eastus"
    kvs_name            = "vm-admin-password"
    size                = "Standard_B2s"
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
    nic_name              = "nic-vm-qa-01"
    resource_group_name   = "rg-qa-eastus"
    lb_name               = "ilb-qa-eastus"
    pool_name             = "ilb-backend-pool"
  }
}

appgws = {
  appgw1 = {
    name                = "appgw-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 1
    }
    gateway_ip_configuration_name  = "appgw-ip-config"
    subnet_name                    = "snet-qa-appgw"
    vnet_name                      = "vnet-qa-eastus"
    frontend_port_name             = "frontend-port-80"
    frontend_port                  = 80
    frontend_ip_configuration_name = "appgw-frontend-ip"
    public_ip_name                 = "pip-appgw-qa-eastus"
    backend_address_pool_name      = "appgw-backend-pool"
    nic1_name                      = "nic-vm-qa-01"
    nic2_name                      = "nic-vm-qa-01"
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
    server_name         = "sql-server-qa-eastus"
    resource_group_name = "rg-qa-eastus"
    location            = "East US"
    version             = "12.0"
    kv_name             = "kv-qa-eastus"
    kvs_name            = "sql-admin-password"
    administrator_login = "sqladmin"
    database_name       = "db-qa-app"
    sku_name            = "S1"
    max_size_gb         = 10
  }
}
