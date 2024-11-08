locals {
  resource_group_name = strcontains(var.app_insights.resource_group, "/resourceGroups/") ? regex("[^\\/]+$", var.app_insights.resource_group) : var.resource_groups[var.app_insights.resource_group].name
}