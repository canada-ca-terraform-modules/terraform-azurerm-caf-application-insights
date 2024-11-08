variable "app_insights" {
  description = "Object the configuration of Application insights to deploy"
  type = any
  default = {}
}

module "app_insights" {
  source = "github.com/canada-ca-terraform-modules/terraform-caf-application_insights.git?ref=v1.0.0"
  for_each = var.app_insights

  userDefinedString = each.key
  env = var.env
  group = var.group
  project = var.project
  resource_groups = local.resource_group_all
  app_insights = each.value
  tags = var.tags
}