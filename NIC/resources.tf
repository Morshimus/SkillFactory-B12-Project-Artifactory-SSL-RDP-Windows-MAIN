# Set the private and public IP 
resource "azurerm_network_interface" "morsh-ni" {
  name                = "${var.prefix}-ni"
  location            = var.location
  resource_group_name = var.rsg
  #network_security_group_id = var.nsg_id

  # dynamic IP configuration
  ip_configuration {
    name                          = "${var.prefix}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_private_alloc_type
    private_ip_address            = var.ip_private_static
    private_ip_address_version    = var.ip_ver
    public_ip_address_id          = var.ip_public
    primary                       = var.int_primary
  }
}