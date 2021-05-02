# resource "azurerm_virtual_network" "vnet" {
#   name                = var.az_vnet["az_vnet_name"]
#   address_space       = [var.az_vnet["az_vnet_address_prefixes"]]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet" "virtual" {
#   name                 = var.az_subnet["az_subnet_name"]
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [var.az_subnet["az_subnet_address_prefixes"]]

#   delegation {
#     name = "aciDelegation"
#     service_delegation {
#       name    = "Microsoft.ContainerInstance/containerGroups"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#     }
#   }
# }

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.az_k8s["az_cluster_name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.az_k8s["az_cluster_dns_prefix"]

  default_node_pool {
    name       = var.az_k8s["az_node_pool_name"]
    node_count = var.az_k8s["az_node_count"]
    vm_size    = var.az_k8s["az_node_vm_size"]
  }

  identity {
    type = var.az_k8s["az_node_identity_type"]
  }

  # addon_profile {
  #   aci_connector_linux {
  #     enabled = true
  #     subnet_name = var.az_subnet["az_subnet_name"]
  #   }
  # }

  tags = {
    Environment = var.az_k8s["az_cluster_tags"]
  }
}

output "client_certificate" {
value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
