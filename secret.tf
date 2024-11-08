locals {
  name-regex                = "/[^0-9A-Za-z-]/" # Anti-pattern to match all characters not in: 0-9 a-z A-Z -
  group_4                   = substr(var.group, 0, 4)
  project_4                 = substr(var.project, 0, 4)
  env_4                = substr(var.env, 0, 4)
  userDefinedString-replace = replace("${local.group_4}-${local.project_4}", "_", "-")
  kv_sha                    = substr(sha1(var.resource_groups["Keyvault"].id), 0, 8)
  name-kv-16                = substr("${local.env_4}CKV-${local.userDefinedString-replace}", 0, 16)
  name-kv-21                = substr("${local.name-kv-16}-${local.kv_sha}", 0, 21)
  kv_name                   = replace("${local.name-kv-21}-kv", local.name-regex, "")
  kv_resource_group_name    = try(var.app_insights.key_vault.resource_group_name, "Keyvault")
}

# Need to get info about the subscription key vault. If password_overwrite is true, then don't bother since we  won't use it
data "azurerm_key_vault" "key_vault" {
  count               = try(var.app_insights.api_key.store_in_keyvault, false) != false ? 1 : 0
  name                = try(var.app_insights.key_vault.name, local.kv_name)
  resource_group_name = strcontains(local.kv_resource_group_name, "/resourceGroups/") ? regex("[^\\/]+$", local.kv_resource_group_name) : var.resource_groups[local.kv_resource_group_name].name
}

resource "azurerm_key_vault_secret" "api-key-secret" {
  count        = try(var.app_insights.api_key.store_in_keyvault, false) != false ? 1 : 0
  name         = "${local.app_insights-name}-api-key"
  value        = azurerm_application_insights_api_key.api_key[0].api_key
  key_vault_id = data.azurerm_key_vault.key_vault[0].id
  content_type = "secret" 

  lifecycle {
    ignore_changes = all
  }
}