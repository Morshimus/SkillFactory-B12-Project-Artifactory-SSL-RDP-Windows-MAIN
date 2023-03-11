output windows-vm1-hostname {
  value       = module.morsh_instance_windows_az_1.windows_vm_hostname
  description = "Hostname of windows vm1"
}


output windows-vm1-admin-username {
  value       = module.morsh_instance_windows_az_1.windows_admin_username
  description = "Admin username of windows vm1"
}


output windows-vm1-admin-password {
  sensitive = true
  value       = data.ansiblevault_path.windows_admin_password.value
  description = "Admin password of windows vm1"
}

output windows-vm1-public-ip {
  value       = azurerm_public_ip.morsh-pip1.ip_address
  description = "Admin username of windows vm1"
}
