/*
 * ==========================================
 *   THE IS FOR DEMO PURPOSE
 *   Author: ZHEN YUAN
 *   Year: 2021
 * ==========================================
*/

# Azure Resource Managment
variable "az_rm" {
    type = map
    default = {
        "az_env" ="Development"
        "az_region"= "Australia East"
        "az_group_name" ="k8S"
    }
}

# Azure Containers
variable "az_container" {
    type = map

    default = {
        "az_registry_name" = "k8scr01"
        "az_sku" ="Standard"
    }
}

# Azure Kubernetes
variable "az_k8s" {
    type = map

    default = {
        "az_cluster_name" ="k8sclt"
        "az_cluster_dns_prefix" ="k8sclt"
        "az_cluster_sku"= "Standard"
        "az_node_pool_name" ="agentpool"
        "az_node_count" = 1
        "az_node_vm_size" = "standard_d2as_v4"
        "az_node_identity_type" = "SystemAssigned"
        "az_cluster_tags" ="Development"
    }
}

variable "az_vnet" {
     type = map
  
     default = {
        "az_vnet_name" ="k8svnet"
        "az_vnet_address_prefixes" = "10.0.0.0/16"
    }
}

variable "az_subnet" {
     type = map
  
     default = {
        "az_subnet_name" ="k8saci"
        "az_subnet_address_prefixes" = "10.0.1.0/24"
    }
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}