## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.38.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.54.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.38.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.54.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.group_admins](https://registry.terraform.io/providers/hashicorp/azuread/2.38.0/docs/resources/group) | resource |
| [azuread_group.group_users](https://registry.terraform.io/providers/hashicorp/azuread/2.38.0/docs/resources/group) | resource |
| [azurerm_key_vault_secret.ssh_admin_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/network_interface) | resource |
| [azurerm_role_assignment.role_admin](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.role_user](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/role_assignment) | resource |
| [azurerm_virtual_machine_extension.aad_ssh_login_for_linux](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/resources/virtual_machine_extension) | resource |
| [tls_private_key.ssh_admin_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [azuread_users.ad_group_owners](https://registry.terraform.io/providers/hashicorp/azuread/2.38.0/docs/data-sources/users) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.54.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_group_owners"></a> [ad\_group\_owners](#input\_ad\_group\_owners) | A list of owners for the AD-group that allows Linux VM admin access | `list(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name to use for the deploy | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region name | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | The Azure region short name | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The workload resource group | `string` | n/a | yes |
| <a name="input_vm_config"></a> [vm\_config](#input\_vm\_config) | Configuration of the virtual machines | <pre>list(<br>    object({<br>      vm_name              = string<br>      username             = string<br>      size                 = string<br>      publisher            = string<br>      offer                = string<br>      sku                  = string<br>      version              = string<br>      caching              = string<br>      disk_size_gb         = optional(string)<br>      storage_account_type = string<br>      rg_name              = string<br>      nic_name             = string<br>      subnet_id            = string<br>      key_vault_id         = string<br>    })<br>  )</pre> | n/a | yes |

## Outputs

No outputs.
