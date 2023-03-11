variable rsg {
  type        = string
  default     = "morsh-rsg"
  description = "Azure resource group name"
}

variable location {
  type        = string
  default     = "West Europe"
  description = "Azure resource group location DC"
}

variable add_space {
  type        = list(string)
  default     = ["192.168.20.0/23"]
  description = "Azure network ip summary address"
}

variable subnet1_name {
  type        = string
  default     = "morsh-subnet1"
  description = "Azure subnet name"
}

variable add_subnet1{
  type        = list(string)
  default     = ["192.168.21.0/28"]
  description = "Azure subnet ip ranges"

}

