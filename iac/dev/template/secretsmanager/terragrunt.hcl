terraform {
  source = "tfr:///terraform-aws-modules/secrets-manager/aws?version=1.3.1"
}
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

inputs = {
  name  = include.env.locals.name
  secret_string = jsonencode({
    "template_secret" = include.env.locals.template_secret
  })
  create_lifecycle_policy = false
  tags = {
    Name = include.env.locals.name
    Environment = include.env.locals.environment
  }
}