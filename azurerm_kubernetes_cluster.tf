terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0" # Ensure compatibility with AzureRM features
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "subscription_id"
  client_id       = "client_id"
  client_secret   = "client_secret"
  tenant_id       = "tenant_id"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-project"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-free-tier"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3w" # Free tier-eligible VM size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "free-tier"
  }
}

# Output the AKS cluster details
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
