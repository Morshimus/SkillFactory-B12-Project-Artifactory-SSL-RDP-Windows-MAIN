# Create Windows 10 Virtual Machine
resource "azurerm_windows_virtual_machine" "morsh-windows-vm" {
  name                  = "morsh-${var.prefix}-${var.image_sku}"
  location              = var.location
  resource_group_name   = var.rsg
  size                  = var.size
  network_interface_ids = var.network_nics
  tags                  = local.labels

  computer_name  = "morsh-${var.prefix}"
  admin_username = var.admin_username
  admin_password = var.admin_password


  lifecycle {
    ignore_changes = [
      name,
      tags
    ]
  }

  timeouts {
    create = "60m"
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
  enable_automatic_updates   = true
  provision_vm_agent         = true
  allow_extension_operations = false
  encryption_at_host_enabled = true
  winrm_listener {
    protocol = var.winrm.protocol
    #certificate_url = var.winrm.certificate_url
  }

}

