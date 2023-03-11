variable image_publisher {
  type        = string
  default     = "MicrosoftWindowsServer"
  description = "Azure publisher of image"
}


variable image_sku {
  type        = string
  default     = "2022-datacenter-azure-edition"
  description = "Azure sku of image"
}

variable image_offer {
  type        = string
  default     = "WindowsServer"
  description = "Azure windows offer for image"
}

variable image_ver {
  type        = string
  default     = "latest"
  description = "Azure windows image version"
}

variable caching {
  type        = string
  default     = "ReadWrite"
  description = "Azure OS disk caching type"
}

variable storage_account_type {
  type        = string
  default     = "Standard_LRS"
  description = "Azure OS disk storage account type"
}


variable size {
  type        = string
  default     = "Standard_B1s"
  description = "Azure size of vm cpu and memory perfomance"
}

variable prefix {
  type        = string
  default     = "server"
  description = "Azure VM prefix"
}

variable admin_username {
  type        = string
  default     = "morsh-adm"
  description = "Azure vm administrator username"
}

variable winrm {
  type = object({
    protocol = string
    certificate_url = string
  })
  default     = (
    {
        protocol = "Http"
        certificate_url = "" 
    }
  )
  description = "Azure VM Windows winrm service listener"
}


#REQUIRED TO SET 

variable appId {
  type        = string
  description = "Azure SP account application id"
}

variable password {
  type        = string
  description = "Azure SP account application password"
  sensitive = true
}


variable admin_password {
  type        = string
  description = "Azure VM administrator password"
  sensitive = true
}

variable tenantId {
  type        = string
  description = "Azure TenantID"
}


variable subscriptionId {
  type        = string
  description = "Azure subscription Id"
}


variable location {
  type        = string
  description = "Azure location of vm"
}

variable rsg {
  type        = string
  description = "Azure name of resource group"
}


variable network_nics {
  type        = list(string)
  description = "Azure IDs of network nics"
}

