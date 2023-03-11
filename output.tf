output "windows-vm1-hostname" {
  value       = module.morsh_instance_windows_az_1.windows_vm_hostname
  description = "Hostname of windows vm1"
}


output "windows-vm1-admin-username" {
  value       = module.morsh_instance_windows_az_1.windows_admin_username
  description = "Admin username of windows vm1"
}


output "windows-vm1-admin-password" {
  sensitive   = true
  value       = data.ansiblevault_path.windows_admin_password.value
  description = "Admin password of windows vm1"
}

output "windows-vm1-public-ip" {
  value       = azurerm_public_ip.morsh-pip1.ip_address
  description = "Admin username of windows vm1"
}

output "ssh_key_server_pub" {
  value     = data.ansiblevault_path.ssh_server_pub.value
  sensitive = true
}

output "jfrog_artifactory_super_admin_user" {
  value = data.ansiblevault_path.jfrog_artifacory_super_user.value
}

output "jfrog_artifactory_super_admin_password" {
  value     = data.ansiblevault_path.jfrog_artifacory_super_user_password.value
  sensitive = true
}
