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
  value       = module.morsh_instance_windows_az_1.windows_vm_public_ip
  description = "Azure windows vm1 public ip"
}

output "windows-vm1-private-ip" {
  value       = module.morsh_instance_windows_az_1.windows_vm_private_ip
  description = "Azure windows vm1 private ip"
}


output "ssh_key_server_pub" {
  value     = data.ansiblevault_path.ssh_server_pub.value
  sensitive = true
}

output "linux-vm1-hostname" {
  value       = module.morsh_instance_linux_az_1.linux_vm_hostname
  description = "Hostname of linux vm1"
}


output "linux-vm1-admin-username" {
  value       = module.morsh_instance_linux_az_1.linux_admin_username
  description = "Admin username of linux vm1"
}

output "linux-vm1-public-ip" {
  value       = module.morsh_instance_linux_az_1.linux_vm_public_ip
  description = "Azure linux vm1 public ip"
}

output "linux-vm1-private-ip" {
  value       = module.morsh_instance_linux_az_1.linux_vm_private_ip
  description = "Azure linux vm1 private ip"
}

output "jfrog_artifactory_super_admin_user" {
  value = data.ansiblevault_path.jfrog_artifacory_super_user.value
}

output "jfrog_artifactory_super_admin_password" {
  value     = data.ansiblevault_path.jfrog_artifacory_super_user_password.value
  sensitive = true
}

