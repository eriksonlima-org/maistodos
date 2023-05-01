locals {
  project_name = "metabase"
  repository   = "https://github.com/eriksonlima/maistodos.git"
  region       = "us-east-1"
  account_id   = data.aws_caller_identity.self.account_id
  caller_id    = data.aws_caller_identity.self.user_id
  caller_arn   = data.aws_caller_identity.self.arn
  environment  = terraform.workspace

  default_tags = {
    project     = local.project_name
    repository  = local.repository
    terraform   = "true"
    environment = terraform.workspace
  }

  /*
   The attributes acquired through "data sources" cant be used on provider default tags.
   Instead they'll need to be added at each resource.
  */
  tags = {
    last_modified_by_id  = local.caller_id
    last_modified_by_arn = local.caller_arn
  }
}