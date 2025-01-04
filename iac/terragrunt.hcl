locals {
    region = get_env("AWS_REGION")
    db_table = get_env("DYNAMODB_TABLE")
    bucket_region = get_env("BUCKET_REGION")
    bucket_name = get_env("BUCKET_NAME")
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.bucket_name}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.bucket_region}"
    encrypt        = true
    dynamodb_table = "${local.db_table}"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"  
}
EOF
}