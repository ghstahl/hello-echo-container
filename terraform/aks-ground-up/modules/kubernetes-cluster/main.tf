

resource "azurerm_kubernetes_cluster" "main" {
  name                = format("aks-%s",var.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  linux_profile {
    admin_username = "admin"

    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }
  tags                = var.tags
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  dns_prefix            = var.dns_prefix
  default_node_pool  {
    name                  = "aks"
    type                  = "VirtualMachineScaleSets"
    enable_auto_scaling   = true
    enable_node_public_ip = false
    min_count             = "1"
    max_count             = "5"
    vm_size               = "Standard_B2s"
  
    vnet_subnet_id        = var.subnet_id
    
  }
  network_profile {
    network_plugin = "azure"
  }
  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

}