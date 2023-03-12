# lint

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_ansiblevault"></a> [ansiblevault](#requirement\_ansiblevault) | = 2.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.46.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansiblevault"></a> [ansiblevault](#provider\_ansiblevault) | 2.2.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.46.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_morsh_instance_linux_az_1"></a> [morsh\_instance\_linux\_az\_1](#module\_morsh\_instance\_linux\_az\_1) | ./INSTANCE_LINUX | n/a |
| <a name="module_morsh_instance_linux_az_nic1"></a> [morsh\_instance\_linux\_az\_nic1](#module\_morsh\_instance\_linux\_az\_nic1) | ./NIC | n/a |
| <a name="module_morsh_instance_windows_az_1"></a> [morsh\_instance\_windows\_az\_1](#module\_morsh\_instance\_windows\_az\_1) | ./INSTANCE_WINDOWS | n/a |
| <a name="module_morsh_instance_windows_az_nic1"></a> [morsh\_instance\_windows\_az\_nic1](#module\_morsh\_instance\_windows\_az\_nic1) | ./NIC | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.morsh-nsg1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.morsh-nsg2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.morsh-pip1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.morsh-pip2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.morsh-rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.morsh-subnet1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.morsh-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [local_file.azure_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [ansiblevault_path.jfrog_artifacory_super_user](https://registry.terraform.io/providers/MeilleursAgents/ansiblevault/2.2.0/docs/data-sources/path) | data source |
| [ansiblevault_path.jfrog_artifacory_super_user_password](https://registry.terraform.io/providers/MeilleursAgents/ansiblevault/2.2.0/docs/data-sources/path) | data source |
| [ansiblevault_path.ssh_server_pub](https://registry.terraform.io/providers/MeilleursAgents/ansiblevault/2.2.0/docs/data-sources/path) | data source |
| [ansiblevault_path.windows_admin_password](https://registry.terraform.io/providers/MeilleursAgents/ansiblevault/2.2.0/docs/data-sources/path) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_space"></a> [add\_space](#input\_add\_space) | Azure network ip summary address | `list(string)` | <pre>[<br>  "192.168.20.0/23"<br>]</pre> | no |
| <a name="input_add_subnet1"></a> [add\_subnet1](#input\_add\_subnet1) | Azure subnet ip ranges | `list(string)` | <pre>[<br>  "192.168.21.0/28"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure resource group location DC | `string` | `"West Europe"` | no |
| <a name="input_rsg"></a> [rsg](#input\_rsg) | Azure resource group name | `string` | `"morsh-rsg"` | no |
| <a name="input_subnet1_name"></a> [subnet1\_name](#input\_subnet1\_name) | Azure subnet name | `string` | `"morsh-subnet1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_jfrog_artifactory_super_admin_password"></a> [jfrog\_artifactory\_super\_admin\_password](#output\_jfrog\_artifactory\_super\_admin\_password) | n/a |
| <a name="output_jfrog_artifactory_super_admin_user"></a> [jfrog\_artifactory\_super\_admin\_user](#output\_jfrog\_artifactory\_super\_admin\_user) | n/a |
| <a name="output_linux-vm1-admin-username"></a> [linux-vm1-admin-username](#output\_linux-vm1-admin-username) | Admin username of linux vm1 |
| <a name="output_linux-vm1-hostname"></a> [linux-vm1-hostname](#output\_linux-vm1-hostname) | Hostname of linux vm1 |
| <a name="output_linux-vm1-private-ip"></a> [linux-vm1-private-ip](#output\_linux-vm1-private-ip) | Azure linux vm1 private ip |
| <a name="output_linux-vm1-public-ip"></a> [linux-vm1-public-ip](#output\_linux-vm1-public-ip) | Azure linux vm1 public ip |
| <a name="output_ssh_key_server_pub"></a> [ssh\_key\_server\_pub](#output\_ssh\_key\_server\_pub) | n/a |
| <a name="output_windows-vm1-admin-password"></a> [windows-vm1-admin-password](#output\_windows-vm1-admin-password) | Admin password of windows vm1 |
| <a name="output_windows-vm1-admin-username"></a> [windows-vm1-admin-username](#output\_windows-vm1-admin-username) | Admin username of windows vm1 |
| <a name="output_windows-vm1-hostname"></a> [windows-vm1-hostname](#output\_windows-vm1-hostname) | Hostname of windows vm1 |
| <a name="output_windows-vm1-private-ip"></a> [windows-vm1-private-ip](#output\_windows-vm1-private-ip) | Azure windows vm1 private ip |
| <a name="output_windows-vm1-public-ip"></a> [windows-vm1-public-ip](#output\_windows-vm1-public-ip) | Azure windows vm1 public ip |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
