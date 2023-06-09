# SkillFactory-B12-Project-Artifactory-SSL-RDP-Windows-MAIN

## [Roles](https://github.com/Morshimus/SkillFactory-B12-Project-Artifactory-SSL-RDP-Windows-Roles)

## Задание:
* [x] - :one: **Создайте в ~~Я.Облаке~~ Azure виртуальную машину под управлением Linux. Это будет ВМ для УЦ.**
> Сделано, создание в Azure влечет за собой создание ресурс группы - было решено что будет создана 1 ресурс группа для обоих ВМ.ВМ на линукс Ubuntu-22-04 успешно создается из Terraform.

```mermaid

graph LR

subgraph Resource Group
    rg[azurerm_resource_group.morsh-rsg]
end

subgraph Virtual Network
    vnet[azurerm_virtual_network.morsh-vnet]
end

subgraph Subnet
    subnet[azurerm_subnet.morsh-subnet1]
end

subgraph Public IP Addresses
    pip1[azurerm_public_ip.morsh-pip1]
    pip2[azurerm_public_ip.morsh-pip2]
end

subgraph Network Security Groups
    nsg1[azurerm_network_security_group.morsh-nsg1]
    nsg2[azurerm_network_security_group.morsh-nsg2]
end

subgraph NIC Modules
    nic1[morsh_instance_windows_az_nic1]
    nic2[morsh_instance_linux_az_nic1]
end

subgraph Windows VM Module
    win_vm[morsh_instance_windows_az_1]
end

subgraph Linux VM Module
    linux_vm[morsh_instance_linux_az_1]
end

subgraph Local File
    file[local_file.azure_inventory]
end

rg --> vnet
vnet --> subnet
rg --> pip1
rg --> pip2
rg --> nsg1
rg --> nsg2
vnet --> nic1
vnet --> nic2
subnet --> nic1
subnet --> nic2
nic1 --> win_vm
nic2 --> linux_vm
file --> win_vm
file --> linux_vm

```

```hcl
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
```
* [x] - :two: **~~Создайте новую внутреннюю доменную зону (используя ~~Yandex Cloud~~ Azure DNS), затем добавьте в эту зону новую DNS-запись, указывающую на машину с Artifactory. Доменное имя используйте любое на свое усмотрение~~**
> Я подкинкинул запись в %Systemroot%\System32\drivers\etc\hosts. Лучше делать через хостинг..

* [x] - :three: **~~На ВМ для УЦ создайте корневой и серверный сертификат для вашей машины (для выбранного вами доменного имени).~~ Взял серт временный с работы - он валидный, для теста**
> Взял серт временный с работы - он валидный, для теста. А так если есть свой хостинг можно автоматизировать через acme.

* [x] - :four: **~~Настройте Artifatory на использование SSL и созданного вами сертификата. (Выбирайте любой из вариантов: настройка SSL на ~~TomCat, работающем с Artifactory веб-сервере,~~ либо настройка связки nginx+Artifactory).~~**
> Был сделан наименее ресурсно затратный вариант

```yaml
artifactory:
    tomcat:
         httpsConnector:
                 enabled: true
                 port: 8443
                 certificateFile: /opt/jfrog/artifactory/var/etc/artifactory/security/ssl/server.crt
                 certificateKeyFile: /opt/jfrog/artifactory/var/etc/artifactory/security/ssl/server.key
access:
     ...
```

* [x] - :five: **Создайте еще одну машину в ~~Я.Облаке~~ Azure, теперь под управлением Windows. Она потребуется для проверки выполнения задания.**
> Машина создана из Terraform, открыты порты RDP и WinRM. Также открыты порты внутри группы - 8443 artifactory и 8082 access.

```hcl
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
```


* [x] - :six: **~~Установите созданный вами корневой сертификат на вашу ВМ под управлением Windows. (Созданное выше доменное имя будет работать только на машинах из ~~Я.Облака~~ Azure, поэтому проверить настройки с помощью своего ноутбука не выйдет).~~**
> Все так, только если сертфикат заверен глобальным трастовым центром эти танцы не нужны.

* [x] - :seven: **~~С помощью веб-браузера зайдите (по HTTPS-протоколу) на машину, где развернут Artifactory, и убедитесь, что соединение защищено.~~**
> Внизу скрины.

* [x] - :eight: **Отправьте ментору скриншот с подтверждением защищенного соединения, доменное имя вашей машины и порт, на котором работает Artifactory.**

![image](https://ams03pap004files.storage.live.com/y4mPwMwTQ1F19WuiQ6i-iHbK0YYylyvQwPm_l2UWGMZcR64YFJJHohdXne0FMSmncqdMtSN1pR50KC69f1zu7yygnANA-_bmb4EkZ3Jx0rYwVpKtI6Bl9aKoSinqApXkNj-4FxizEMWTJwohAIyBLVxXs2BYewu9Y-3hUMo14r2rfy6OBI8IwIG9LlGhUeEjwst?encodeFailures=1&width=1549&height=801)

![image](https://ams03pap004files.storage.live.com/y4mpjIClHUOIlMgE5vbbVmrnppYECc0ixbmS9My4aVzUGF0QuC4C8y40pttVXc3QJgxKdwLZsI0VJNDQBNFUYwRXmJGX8P2Z15XoKA_LnQupXc_DzKjwqlp-Lnvrn2UdEJrumbqL80Z5ul7HQiSGexmjhXgV5YGjFYsODBaGCFaGi8nxf3rdHJNUpVO1GxR8dFB?encodeFailures=1&width=789&height=801)


*А еще я посчитал инфракост, так как Azure не дешевый*

# Infracost Azure:

| version              | 0.2                          |
|----------------------|------------------------------|
| metadata             | [object Object]              |
| currency             | USD                          |
| projects             | B12              |
| totalHourlyCost      | 0.2122082191780820992        |
| totalMonthlyCost     | 154.912                      |
| pastTotalHourlyCost  | 0.2122082191780820992        |
| pastTotalMonthlyCost | 154.912                      |
| diffTotalHourlyCost  | 0                            |
| diffTotalMonthlyCost | 0                            |
| timeGenerated        | 2023-03-23T14:23:28.8956898Z |



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


[def]: https://github.com/Morshimus/SkillFactory-B12-Project-Artifactory-SSL-RDP-Windows-Roles
