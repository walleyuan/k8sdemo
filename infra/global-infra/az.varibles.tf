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
        "az_group_name" ="qbe-global"
    }
}

# Azure Containers
variable "az_container" {
    type = map

    default = {
        "az_registry_name" = "dockerctr"
        "az_sku" ="Standard"
    }
}