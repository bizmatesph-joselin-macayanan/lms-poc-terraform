module "vpc_lms" {
  providers = { aws = aws.lms }
  source    = "git@github.com:bizmatesinc/terraform-template-module.git//aws_modules/module_vpc?ref=v2.1.4"

  // Network
  availability_zones          = ["ap-northeast-1a", "ap-northeast-1c"]
  internal_availability_zones = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  cidr_block                  = local.lms.vpc.cidr_block
  project_name                = local.lms.env_name
  vpc_name_suffix             = "-vpc"
  enable_termination          = var.ENABLE_TERMINATION

  // Subnet
  enable_public_subnet   = true
  enable_private_subnet  = true
  enable_internal_subnet = false

  // Bastion
  is_bastion_enabled = false

  // Route53
  is_nat_ip_record_enabled = false
}
