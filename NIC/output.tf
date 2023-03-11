output azure_nic_id {
  value       = azurerm_network_interface.morsh-ni.id
  sensitive   = true
  description = "ID of created nic for vm"
}
