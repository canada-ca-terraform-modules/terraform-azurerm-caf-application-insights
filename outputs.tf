output "application_insights_object" {
  description = "Outputs the application insights object"
  value = azurerm_application_insights.insights
}

output "application_insights_id" {
  description = "Outputs the application insights ID"
  value = azurerm_application_insights.insights.id
}

output "application_insights_name" {
  description = "Outputs the application insights name"
  value = azurerm_application_insights.insights.name
}

output "application_insights_instrumentation_key" {
  description = "Outputs the application insights instrumentation key"
  value = azurerm_application_insights.insights.instrumentation_key
}

output "application_insights_connection_string" {
  description = "Outputs the application insights connection string"
  value = azurerm_application_insights.insights.connection_string
}

output "application_insights_api_key" {
  description = "Outputs the application insights API Key secret (sensitive)"
  value = try(azurerm_application_insights_api_key.api_key[0].api_key, null)
}

