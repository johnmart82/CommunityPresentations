# Usage - tags = merge(local.common_tags) in resources
locals {
  common_tags = {
    CreatedDate = var.Tag_CreatedDate
    Usage       = var.Tag_Usage
    AutoCleanUp = var.Tag_AutoCleanUp
  }
}