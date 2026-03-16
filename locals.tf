locals {
  common_tags = {
    Environment = var.environment
    Github_repo = "pc-eventbridge-wrapper"
  }
  owner     = "pc"
  bus_name  = "${local.owner}-${var.bus_name}-${var.region}-${var.environment}-bus"
  role_name = "${local.owner}-${var.role_name}-${var.region}-${var.environment}-${var.event_source_name}-role"
  role_tags = merge(local.common_tags, var.role_name)
  tags      = merge(local.common_tags, var.bus_name, var.role_name)
}