provider "aws" {
  region = "ap-northeast-1"
}

variable "ACCOUNT_ID" {
  type    = string
  default = "<to be replace>"
}
variable "AWS_ACCESS_KEY" {
  type    = string
  default = "<to be replace>"
}
variable "AWS_SECRET_KEY" {
  type    = string
  default = "<to be replace>"
}
variable "AWS_SESSION_TOKEN" {
  type    = string
  default = "<to be replace>"
}
variable "ENVIRONMENT" {
  type    = string
  default = "staging"
}

variable "READONLY_MODE" { // Switch readonly role or administrator role.
  type    = bool
  default = true // Default is "true" Turns off in the Terraform cloud environment variable when deploy.
}
