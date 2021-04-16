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
        "az_env" ="DEV"
        "az_region"= "Australia East"
        "az_group_name" ="k8s_dev"
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
        "az_cluster_name" ="k8scluster_dev"
        "az_cluster_dns_prefix" ="k8sclt"
        "az_cluster_sku"= "Standard"
        "az_node_pool_name" ="default"
        "az_node_count" = 1
        "az_node_vm_size" = "standard_d2as_v4"
        "az_node_identity_type" = "SystemAssigned"
        "az_cluster_tags" ="DEV"
    }
}