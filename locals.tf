locals {
  common_tags = {
    Environment = var.environment
    Github_repo = "pc-eventbridge-wrapper"
  }
  owner     = "pc"
  bus_name  = var.bus_name == "" ? "${local.owner}-${var.bus_name}-${var.region}-${var.environment}-bus" : var.bus_name
  role_name = var.role_name == "" ? "${local.owner}-${var.bus_name}-${var.region}-${var.environment}-role" : var.role_name
  role_tags = merge(local.common_tags, var.role_name)
  tags      = merge(local.common_tags, var.bus_name, var.role_name)
}