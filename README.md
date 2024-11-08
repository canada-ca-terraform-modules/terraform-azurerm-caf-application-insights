<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_application_insights_api_key.api_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights_api_key) | resource |
| [azurerm_key_vault_secret.api-key-secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_insights"></a> [app\_insights](#input\_app\_insights) | App insights object containing all paramaters | `any` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | (Required) Environment string for the object | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Group for the project | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) specifies the Azure location where the resource exists | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project name | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | (Required) Resource group object containing a list of the resource group in the target project | `any` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Object containing subnet objects of the target project | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources | `map(string)` | `{}` | no |
| <a name="input_userDefinedString"></a> [userDefinedString](#input\_userDefinedString) | (Required) UserDefinedString part of the name for the application insight | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_insights_api_key"></a> [application\_insights\_api\_key](#output\_application\_insights\_api\_key) | Outputs the application insights API Key secret (sensitive) |
| <a name="output_application_insights_connection_string"></a> [application\_insights\_connection\_string](#output\_application\_insights\_connection\_string) | Outputs the application insights connection string |
| <a name="output_application_insights_id"></a> [application\_insights\_id](#output\_application\_insights\_id) | Outputs the application insights ID |
| <a name="output_application_insights_instrumentation_key"></a> [application\_insights\_instrumentation\_key](#output\_application\_insights\_instrumentation\_key) | Outputs the application insights instrumentation key |
| <a name="output_application_insights_name"></a> [application\_insights\_name](#output\_application\_insights\_name) | Outputs the application insights name |
| <a name="output_application_insights_object"></a> [application\_insights\_object](#output\_application\_insights\_object) | Outputs the application insights object |
<!-- END_TF_DOCS -->