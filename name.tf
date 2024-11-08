locals {
  anti-pattern-regex = "/[//\"'\\[\\]_:|<>+=;,?*@&]/"
  app_insights-name = replace("${var.env}-${var.group}-${var.project}-${var.userDefinedString}-appi", local.anti-pattern-regex, "")
}