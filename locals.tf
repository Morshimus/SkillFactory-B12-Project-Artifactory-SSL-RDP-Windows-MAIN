locals {

  azure_auth = jsondecode(file("${path.module}/azure_key.json"))

  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      user1     = module.morsh_instance_windows_az_1.windows_admin_username,
      ip1       = azurerm_public_ip.morsh-pip1.ip_address,
      hostname1 = module.morsh_instance_windows_az_1.windows_vm_hostname
    }
  )

  loc_path = "${path.module}/"
}