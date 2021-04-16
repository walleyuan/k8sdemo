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

  tags = {
    Environment = var.az_k8s["az_cluster_tags"]
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}