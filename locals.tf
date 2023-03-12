locals {

  azure_auth = jsondecode(file("${path.module}/azure_key.json"))

  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      user1     = module.morsh_instance_windows_az_1.windows_admin_username,
      ip1       = module.morsh_instance_windows_az_1.windows_vm_public_ip,
      hostname1 = module.morsh_instance_windows_az_1.windows_vm_hostname,
      user2     = module.morsh_instance_linux_az_1.linux_admin_username,
      ip2       = module.morsh_instance_linux_az_1.linux_vm_public_ip,
      hostname2 = module.morsh_instance_linux_az_1.linux_vm_hostname
    }
  )

  loc_path = "${path.module}/"
}