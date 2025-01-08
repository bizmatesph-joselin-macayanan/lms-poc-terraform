## lms config
locals {
  lms_config = {
    name         = local.project_name
    default_tags = merge(local.service_account.default_tags, { Service = "lms" })
    ignore_tags  = concat(local.service_account.ignore_tags, [])
    vpc = {
      cidr_blocks = {
        production  = "10.193.0.0/16"
        staging     = "10.192.0.0/16"
        development = "10.191.0.0/16"
      }
    }
  }
}

locals {
  lms = {
    name         = lower(local.project_name)
    env_name     = "${lower(local.env_prefix)}${lower(local.project_name)}"
    default_tags = local.lms_config.default_tags
    ignore_tags   = local.lms_config.ignore_tags
    vpc = {
      cidr_block = local.lms_config.vpc.cidr_blocks[lower(var.ENVIRONMENT)]
    }
  }
}
