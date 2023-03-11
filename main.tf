terraform {
  required_version = ">= 1.3.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.46.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.3.0"
    }
    ansiblevault = {
      source  = "MeilleursAgents/ansiblevault"
      version = "= 2.2.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "morsh-tfstate-rg"
    storage_account_name = "morshtfwqg2tuog"
    container_name       = "core-tfstate"
    key                  = "SF-B12-Project-Artifactory-RDP.tfstate"
  }
}




