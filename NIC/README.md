# NIC

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
| [azurerm_network_interface.morsh-ni](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appId"></a> [appId](#input\_appId) | Azure SP account application id | `string` | n/a | yes |
| <a name="input_int_primary"></a> [int\_primary](#input\_int\_primary) | Azure nic interface ip configuration priority, if exist more than 1. | `bool` | `true` | no |
| <a name="input_ip_private_alloc_type"></a> [ip\_private\_alloc\_type](#input\_ip\_private\_alloc\_type) | Azure nic type of allocation address for nic. If Static picked required parameter ip\_private\_static! | `string` | `"Dynamic"` | no |
| <a name="input_ip_private_static"></a> [ip\_private\_static](#input\_ip\_private\_static) | Azure private ip address. If not dynamic. | `string` | `""` | no |
| <a name="input_ip_public"></a> [ip\_public](#input\_ip\_public) | Azure Public IP address id created for that nic | `string` | n/a | yes |
| <a name="input_ip_ver"></a> [ip\_ver](#input\_ip\_ver) | Azure nic IP version. Possible values IPv4 or IPv6 | `string` | `"IPv4"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location of vm | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Azure SP account application password | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Azure nic name prefix | `string` | `"some-server"` | no |
| <a name="input_rsg"></a> [rsg](#input\_rsg) | Azure name of resource group | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Azure subnet id where will be pluged in nic | `string` | n/a | yes |
| <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId) | Azure subscription Id | `string` | n/a | yes |
| <a name="input_tenantId"></a> [tenantId](#input\_tenantId) | Azure TenantID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_nic_id"></a> [azure\_nic\_id](#output\_azure\_nic\_id) | ID of created nic for vm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
