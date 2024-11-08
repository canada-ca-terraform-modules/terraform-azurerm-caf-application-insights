variable "env" {
  description = "(Required) Environment string for the object"
  type = string
}

variable "group" {
  description = "(Required) Group for the project"
  type = string
}

variable "project" {
  description = "(Required) Project name"
  type = string
}

variable "userDefinedString" {
  description = "(Required) UserDefinedString part of the name for the application insight"
  type = string
}

variable "location" {
  description = "(Required) specifies the Azure location where the resource exists"
  type = string
  default = "canadacentral"
}

variable "resource_groups" {
    description = "(Required) Resource group object containing a list of the resource group in the target project"
    type = any  
}

variable "app_insights" {
  description = "App insights object containing all paramaters"
  type = any
  default = {}
}

variable "subnets" {
  description = "Object containing subnet objects of the target project"
  type = any
  default = {}
}

variable "tags" {
  description = "Tags for the resources"
  type = map(string)
  default = {}
}