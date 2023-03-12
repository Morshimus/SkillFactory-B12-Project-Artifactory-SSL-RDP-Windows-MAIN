variable "image_publisher" {
  type        = string
  default     = "Canonical"
  description = "Azure publisher of image"
}


variable "image_sku" {
  type        = string
  default     = "22_04-lts"
  description = "Azure sku of image"
}

variable "image_offer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "Azure linux offer for image"
}

variable "image_ver" {
  type        = string
  default     = "latest"
  description = "Azure linux image version"
}

variable "caching" {
  type        = string
  default     = "ReadWrite"
  description = "Azure OS disk caching type"
}

variable "storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Azure OS disk storage account type"
}


variable "encryption" {
  type        = bool
  default     = false
  description = "Azure Encryption for VM data"
}


variable "size" {
  type        = string
  default     = "Standard_B1s"
  description = "Azure size of vm cpu and memory perfomance"
}

variable "prefix" {
  type        = string
  default     = "server"
  description = "Azure VM prefix"
}




#REQUIRED TO SET 

variable "appId" {
  type        = string
  description = "Azure SP account application id"
}

variable "password" {
  type        = string
  description = "Azure SP account application password"
  sensitive   = true
}

variable "admin_ssh" {
  type = object({
    username   = string
    public_key = string
  })
  description = "Azure VM Linux ssh admin access by private key"
}

variable "tenantId" {
  type        = string
  description = "Azure TenantID"
}


variable "subscriptionId" {
  type        = string
  description = "Azure subscription Id"
}


variable "location" {
  type        = string
  description = "Azure location of vm"
}

variable "rsg" {
  type        = string
  description = "Azure name of resource group"
}


variable "network_nics" {
  type        = list(string)
  description = "Azure IDs of network nics"
}


