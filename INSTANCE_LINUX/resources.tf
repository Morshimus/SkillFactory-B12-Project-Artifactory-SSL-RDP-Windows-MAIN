resource "azurerm_linux_virtual_machine" "morsh-linux-vm" {
  name                  = "morsh-${var.prefix}-${var.image_sku}"
  resource_group_name   = var.rsg
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_ssh.username
  network_interface_ids = var.network_nics
  computer_name         = "morsh-${var.prefix}"
  tags                  = local.labels

  lifecycle {
    ignore_changes = [
      name,
      tags
    ]
  }

  timeouts {
    create = "60m"
  }


  admin_ssh_key {
    username   = var.admin_ssh.username
    public_key = var.admin_ssh.public_key
  }

  os_disk {
    name                 = "${var.prefix}-${var.image_sku}-os-disk"
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_ver
  }

  provision_vm_agent         = true
  allow_extension_operations = false
  encryption_at_host_enabled = var.encryption
}