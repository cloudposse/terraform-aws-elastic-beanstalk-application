module "label" {
  source     = "git::https://github.com/brighte-capital/terraform-null-label.git?ref=tags/0.15.0"
  environment  = var.environment
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

locals {
  // Remove `Name` tag from the map of tags because Elastic Beanstalk generates the `Name` tag automatically
  // and if it is provided, terraform tries to recreate the application on each `plan/apply`
  // `Namespace` should be removed as well since any string that contains `Name` forces recreation
  // https://github.com/terraform-providers/terraform-provider-aws/issues/3963
  tags = { for t in keys(module.label.tags) : t => module.label.tags[t] if t != "Name" && t != "Namespace" }
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = var.name
  description = var.description
  tags        = local.tags
}

/* resource "aws_elastic_beanstalk_application_version" "application_version" {
  name        = var.application_version_name
  application = var.name
  description = var.application_version_description
  bucket      = var.application_version_s3_bucket
  key         = var.application_version_s3_bucket_object
} */