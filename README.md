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
| <a name="module_morsh_instance_windows_az_1"></a> [morsh\_instance\_windows\_az\_1](#module\_morsh\_instance\_windows\_az\_1) | ./INSTANCE_WINDOWS | n/a |
| <a name="module_morsh_instance_windows_az_nic1"></a> [morsh\_instance\_windows\_az\_nic1](#module\_morsh\_instance\_windows\_az\_nic1) | ./NIC | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.morsh-nsg1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.morsh-pip1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.morsh-rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.morsh-subnet1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.morsh-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [local_file.azure_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
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
| <a name="output_windows-vm1-admin-password"></a> [windows-vm1-admin-password](#output\_windows-vm1-admin-password) | Admin password of windows vm1 |
| <a name="output_windows-vm1-admin-username"></a> [windows-vm1-admin-username](#output\_windows-vm1-admin-username) | Admin username of windows vm1 |
| <a name="output_windows-vm1-hostname"></a> [windows-vm1-hostname](#output\_windows-vm1-hostname) | Hostname of windows vm1 |
| <a name="output_windows-vm1-public-ip"></a> [windows-vm1-public-ip](#output\_windows-vm1-public-ip) | Admin username of windows vm1 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
