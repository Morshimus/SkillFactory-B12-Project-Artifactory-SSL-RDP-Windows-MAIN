output "linux_vm_hostname" {
  description = "Azure Windows VM hostanme"
  value       = azurerm_linux_virtual_machine.morsh-linux-vm.computer_name
}

output "linux_admin_username" {
  value       = azurerm_linux_virtual_machine.morsh-linux-vm.admin_username
  description = "Azure Windows VM admin username"
}


output "linux_vm_public_ip" {
  value       = azurerm_linux_virtual_machine.morsh-linux-vm.public_ip_address
  description = "Azure Windows VM public ip"
}

output "linux_vm_private_ip" {
  value       = azurerm_linux_virtual_machine.morsh-linux-vm.private_ip_address
  description = "Azure Windows VM  private ip"
}


