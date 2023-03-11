variable "prefix" {
  type        = string
  default     = "some-server"
  description = "Azure nic name prefix"
}

variable "ip_private_alloc_type" {
  type        = string
  default     = "Dynamic"
  description = <<EOF
  Azure nic type of allocation address for nic. If Static picked required parameter ip_private_static!
  EOF

}

variable "ip_private_static" {
  type        = string
  default     = ""
  description = "Azure private ip address. If not dynamic."
}

variable "ip_ver" {
  type        = string
  default     = "IPv4"
  description = "Azure nic IP version. Possible values IPv4 or IPv6"
}

variable "int_primary" {
  type        = bool
  default     = true
  description = "Azure nic interface ip configuration priority, if exist more than 1."
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

#variable "nsg_id" {
#  type        = string
#  description = "Azure network security group id to bind"
#}

variable "ip_public" {
  type        = string
  description = "Azure Public IP address id created for that nic"
}

variable "subnet_id" {
  type        = string
  description = "Azure subnet id where will be pluged in nic"
}


