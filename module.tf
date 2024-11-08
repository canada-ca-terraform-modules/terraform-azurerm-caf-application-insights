resource "azurerm_application_insights" "insights" {
  name = local.app_insights-name
  resource_group_name = local.resource_group_name
  location = var.location
  application_type = var.app_insights.application_type

  daily_data_cap_in_gb = try(var.app_insights.daily_data_cap_in_gb, 100)
  daily_data_cap_notifications_disabled = try(var.app_insights.daily_data_cap_notifications_disabled, false)
  retention_in_days = try(var.app_insights.retention_in_days, 90)
  sampling_percentage = try(var.app_insights.sampling_percentage, 100)
  disable_ip_masking = try(var.app_insights.disable_ip_masking, false)
  workspace_id = try(var.app_insights.workspace_id, null)
  local_authentication_disabled = try(var.app_insights.local_authentication_disabled, false)
  internet_ingestion_enabled = try(var.app_insights.internet_ingestion_enabled, false)
  internet_query_enabled = try(var.app_insights.internet_query_enabled, false)
  force_customer_storage_for_profiler = try(var.app_insights.force_customer_storage_for_profiler, false)

  tags = merge(var.tags, try(var.app_insights.tags, {}))
}

resource "azurerm_application_insights_api_key" "api_key" {
  count = try(var.app_insights.api_key, null) != null ? 1 : 0
  name = "${local.app_insights-name}-key"
  application_insights_id = azurerm_application_insights.insights.id

  read_permissions = try(var.app_insights.api_key.read_permissions, null)
  write_permissions = try(var.app_insights.api_key.write_permissions, null)
}