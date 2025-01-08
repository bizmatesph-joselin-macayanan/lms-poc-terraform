provider "aws" {
  alias = "lms"

  region              = "ap-northeast-1"
  access_key          = var.AWS_ACCESS_KEY
  secret_key          = var.AWS_SECRET_KEY
  token               = var.AWS_SESSION_TOKEN
  allowed_account_ids = [var.ACCOUNT_ID]

  # assume_role {
  #   role_arn     = var.READONLY_MODE ? "arn:aws:iam::${var.ACCOUNT_ID}:role/tfdeploy/terraform-deploy-readonly" : "arn:aws:iam::${var.ACCOUNT_ID}:role/tfdeploy/terraform-deploy-admin"
  #   session_name = "TF_DEPLOY_${var.ACCOUNT_ID}"
  # }

  default_tags {
    tags = local.lms.default_tags
  }
  ignore_tags {
    keys = local.lms.ignore_tags
  }
}
