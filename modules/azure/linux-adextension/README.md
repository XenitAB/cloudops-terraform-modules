## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.19.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.8.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.8.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.ssh_kv](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.ssh_admin_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/network_interface) | resource |
| [tls_private_key.ssh_admin_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The common name for this deployment | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name to use for the deploy | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region name | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | The Azure region short name | `string` | n/a | yes |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | The name of the Network Interface | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the Resource Group | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet where the VM resides | `string` | n/a | yes |
| <a name="input_unique_suffix"></a> [unique\_suffix](#input\_unique\_suffix) | Unique suffix that is used in globally unique resources names | `string` | n/a | yes |
| <a name="input_vm_config"></a> [vm\_config](#input\_vm\_config) | Configuration of the virtual machines | <pre>object({<br>    username             = string<br>    size                 = string<br>    publisher            = string<br>    offer                = string<br>    sku                  = string<br>    version              = string<br>    caching              = string<br>    disk_size_gb         = optional(string)<br>    storage_account_type = string<br>  })</pre> | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Count index | `number` | n/a | yes |

## Outputs

No outputs.
