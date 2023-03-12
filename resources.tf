# Build the Resource Group
resource "azurerm_resource_group" "morsh-rsg" {
  name     = var.rsg
  location = var.location
}


# Build the Virtual Network
resource "azurerm_virtual_network" "morsh-vnet" {
  name                = "${var.rsg}-vnet"
  address_space       = var.add_space
  location            = var.location
  resource_group_name = azurerm_resource_group.morsh-rsg.name
}

# Build subnet
resource "azurerm_subnet" "morsh-subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.morsh-rsg.name
  virtual_network_name = azurerm_virtual_network.morsh-vnet.name
  address_prefixes     = var.add_subnet1
}

# Create Public IP
resource "azurerm_public_ip" "morsh-pip1" {
  name                = "morsh-pip1"
  location            = var.location
  resource_group_name = azurerm_resource_group.morsh-rsg.name
  allocation_method   = "Dynamic"


}

# Create Public IP
resource "azurerm_public_ip" "morsh-pip2" {
  name                = "morsh-pip2"
  location            = var.location
  resource_group_name = azurerm_resource_group.morsh-rsg.name
  allocation_method   = "Dynamic"


}

# Network Security Groups
resource "azurerm_network_security_group" "morsh-nsg1" {
  name                = "${var.rsg}-nsg-external"
  location            = var.location
  resource_group_name = azurerm_resource_group.morsh-rsg.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 3389
    source_address_prefix      = "*"
    destination_address_prefix = "${module.morsh_instance_windows_az_1.windows_vm_public_ip}/32"
  }

  security_rule {
    name                       = "Winrm-Http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 5985
    source_address_prefix      = "*"
    destination_address_prefix = "${module.morsh_instance_windows_az_1.windows_vm_public_ip}/32"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    source_address_prefix      = "*"
    destination_address_prefix = "${module.morsh_instance_linux_az_1.linux_vm_public_ip}/32"
  }

}

resource "azurerm_network_security_group" "morsh-nsg2" {
  name                = "${var.rsg}-nsg-internal"
  location            = var.location
  resource_group_name = azurerm_resource_group.morsh-rsg.name

  security_rule {
    name                       = "Https"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 443
    source_address_prefix      = "*"
    destination_address_prefix = var.add_subnet1[0]
  }

  security_rule {
    name                       = "ICMP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = var.add_subnet1[0]
  }

}

module "morsh_instance_windows_az_nic1" {

  source         = "./NIC"
  prefix         = "win-server1"
  rsg            = azurerm_resource_group.morsh-rsg.name
  location       = azurerm_resource_group.morsh-rsg.location
  appId          = local.azure_auth.appId
  password       = local.azure_auth.password
  tenantId       = local.azure_auth.tenantId
  subscriptionId = local.azure_auth.subscriptionId
  #nsg_id         = azurerm_network_security_group.morsh-nsg1.id
  subnet_id = azurerm_subnet.morsh-subnet1.id
  ip_public = azurerm_public_ip.morsh-pip1.id

}

module "morsh_instance_linux_az_nic1" {

  source         = "./NIC"
  prefix         = "lin-server1"
  rsg            = azurerm_resource_group.morsh-rsg.name
  location       = azurerm_resource_group.morsh-rsg.location
  appId          = local.azure_auth.appId
  password       = local.azure_auth.password
  tenantId       = local.azure_auth.tenantId
  subscriptionId = local.azure_auth.subscriptionId
  #nsg_id         = azurerm_network_security_group.morsh-nsg1.id
  subnet_id = azurerm_subnet.morsh-subnet1.id
  ip_public = azurerm_public_ip.morsh-pip2.id

}

module "morsh_instance_windows_az_1" {

  source         = "./INSTANCE_WINDOWS"
  appId          = local.azure_auth.appId
  password       = local.azure_auth.password
  tenantId       = local.azure_auth.tenantId
  subscriptionId = local.azure_auth.subscriptionId
  rsg            = azurerm_resource_group.morsh-rsg.name
  location       = azurerm_resource_group.morsh-rsg.location
  network_nics   = [module.morsh_instance_windows_az_nic1.azure_nic_id]
  prefix         = "win-s1"
  admin_password = data.ansiblevault_path.windows_admin_password.value
}

module "morsh_instance_linux_az_1" {

  source         = "./INSTANCE_LINUX"
  appId          = local.azure_auth.appId
  password       = local.azure_auth.password
  tenantId       = local.azure_auth.tenantId
  subscriptionId = local.azure_auth.subscriptionId
  rsg            = azurerm_resource_group.morsh-rsg.name
  location       = azurerm_resource_group.morsh-rsg.location
  network_nics   = [module.morsh_instance_linux_az_nic1.azure_nic_id]
  prefix         = "lin-s1"
  admin_ssh = ({

    username   = "morsh-adm"
    public_key = data.ansiblevault_path.ssh_server_pub.value

  })

}


resource "local_file" "azure_inventory" {
  content  = local.ansible_template
  filename = "${path.module}/azure_cloud.ini"
}