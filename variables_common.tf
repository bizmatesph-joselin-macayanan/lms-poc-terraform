## Variables
variable "COGNITO_OIDC_849976347322" { // This value is set securely in the script. Terraform state does not hold a value.
  type = map(any)
  default = {
    client_id     = "Default"
    client_secret = "Default"
  }
}
variable "COGNITO_OIDC_626997519223" { // This value is set securely in the script. Terraform state does not hold a value.
  type = map(any)
  default = {
    client_id     = "Default"
    client_secret = "Default"
  }
}

## Base setting
locals { project_name = "LMS" }
locals {env = "staging" }
locals { env_workload_type = "staging" }
locals { env_prefix = "staging-" }
locals { env_project_name = "${lower(local.env_prefix)}${lower(local.project_name)}" }
locals { terraform_repository = "bizmatesinc/terraform-${lower(local.project_name)}-workload/${lower(var.ENVIRONMENT)}-env" }
locals { terraform_workspace = "${local.project_name}-${title(lower(var.ENVIRONMENT))}" }


## Account global setting
locals {
  service_account = {
    default_tags = {
      CodedResource  = "true"
      IaC            = "terraform-cloud"
      Service        = lower(local.env_project_name)
      Environment    = lower(var.ENVIRONMENT)
      TFRepository   = "${local.terraform_repository}"
      TFRepository   = "${local.terraform_repository}"
      TFWorkspace    = "${local.terraform_workspace}"
      CmBillingGroup = "LS ${title(lower(var.ENVIRONMENT))}"
    }
    ignore_tags = [
      "SET.AutoUpdateEnable",
      "SET.AutoUpdateScheduleCron",
      "SET.AutoStartEnable",
      "SET.AutoStartScheduleCron",
      "SET.AutoStopEnable",
      "SET.AutoStopScheduleCron",
      "SET.DefaultTaskCount",
      "SET.DefaultInstanceType",
      "SET.DefaultInstanceNodeCount",
      "SET.DefaultNodeType",
      "SET.DefaultCapacity"
    ]
  }
}
