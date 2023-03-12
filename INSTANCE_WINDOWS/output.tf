output "windows_vm_hostname" {
  value       = azurerm_windows_virtual_machine.morsh-windows-vm.computer_name
  description = "Azure Windows VM hostanme"
}

output "windows_admin_username" {
  value       = azurerm_windows_virtual_machine.morsh-windows-vm.admin_username
  description = "Azure Windows VM admin username"
}


output "windows_vm_public_ip" {
  value       = azurerm_windows_virtual_machine.morsh-windows-vm.public_ip_address
  description = "Azure Windows VM public ip"
}


output "windows_vm_private_ip" {
  value       = azurerm_windows_virtual_machine.morsh-windows-vm.private_ip_address
  description = "Azure Windows VM private ip"
}

