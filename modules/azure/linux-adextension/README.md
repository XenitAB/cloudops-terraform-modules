## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.19.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.8.0/docs/resources/network_interface) | resource |
| [random_password.vm_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The commonName to use for the deploy | `string` | n/a | yes |
| <a name="input_common_name_short"></a> [common\_name\_short](#input\_common\_name\_short) | Short commonName to use as VM hostname | `string` | n/a | yes |
| <a name="input_core_config"></a> [core\_config](#input\_core\_config) | The configuration of the core infra | <pre>object({<br>    common_name = string<br>    subnet_name = string<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment of the Azure resource, prod, test, uat. | `string` | n/a | yes |
| <a name="input_environment_short"></a> [environment\_short](#input\_environment\_short) | The environment of the Azure resource, p = prod, t = test u = uat. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region to create things in. | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | The Azure region short name. | `string` | n/a | yes |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet where the VM recide in | `string` | n/a | yes |
| <a name="input_vm_config"></a> [vm\_config](#input\_vm\_config) | Configuration of the virtual machines | <pre>object({<br>    count    = number<br>    name     = string<br>    username = string<br>    size     = string<br>    nic_name = string<br>    sourceImageReference = object({<br>      publisher = string<br>      offer     = string<br>      sku       = string<br>      version   = string<br>    })<br>    storageOsDisk = object({<br>      name                 = string<br>      caching              = string<br>      disk_size_gb         = string<br>      storage_account_type = string<br>    })<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
