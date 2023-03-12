# INSTANCE_WINDOWS

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_windows_virtual_machine.morsh-windows-vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Azure VM administrator password | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Azure vm administrator username | `string` | `"morsh-adm"` | no |
| <a name="input_appId"></a> [appId](#input\_appId) | Azure SP account application id | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | Azure OS disk caching type | `string` | `"ReadWrite"` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | Azure Encryption for VM data | `bool` | `false` | no |
| <a name="input_image_offer"></a> [image\_offer](#input\_image\_offer) | Azure windows offer for image | `string` | `"WindowsServer"` | no |
| <a name="input_image_publisher"></a> [image\_publisher](#input\_image\_publisher) | Azure publisher of image | `string` | `"MicrosoftWindowsServer"` | no |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | Azure sku of image | `string` | `"2022-datacenter-azure-edition"` | no |
| <a name="input_image_ver"></a> [image\_ver](#input\_image\_ver) | Azure windows image version | `string` | `"latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location of vm | `string` | n/a | yes |
| <a name="input_network_nics"></a> [network\_nics](#input\_network\_nics) | Azure IDs of network nics | `list(string)` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Azure SP account application password | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Azure VM prefix | `string` | `"server"` | no |
| <a name="input_rsg"></a> [rsg](#input\_rsg) | Azure name of resource group | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Azure size of vm cpu and memory perfomance | `string` | `"Standard_B2ms"` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Azure OS disk storage account type | `string` | `"Standard_LRS"` | no |
| <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId) | Azure subscription Id | `string` | n/a | yes |
| <a name="input_tenantId"></a> [tenantId](#input\_tenantId) | Azure TenantID | `string` | n/a | yes |
| <a name="input_winrm"></a> [winrm](#input\_winrm) | Azure VM Windows winrm service listener | <pre>object({<br>    protocol        = string<br>    certificate_url = string<br>  })</pre> | <pre>{<br>  "certificate_url": null,<br>  "protocol": "Http"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_windows_admin_username"></a> [windows\_admin\_username](#output\_windows\_admin\_username) | Azure Windows VM admin username |
| <a name="output_windows_vm_hostname"></a> [windows\_vm\_hostname](#output\_windows\_vm\_hostname) | Azure Windows VM hostanme |
| <a name="output_windows_vm_private_ip"></a> [windows\_vm\_private\_ip](#output\_windows\_vm\_private\_ip) | Azure Windows VM private ip |
| <a name="output_windows_vm_public_ip"></a> [windows\_vm\_public\_ip](#output\_windows\_vm\_public\_ip) | Azure Windows VM public ip |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
