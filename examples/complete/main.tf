provider "aws" {
  region = var.region
}

module "elastic_beanstalk_application" {
  source                                     = "../../"
  description                                = var.description
  create_lifecycle_service_role              = var.create_lifecycle_service_role
  appversion_lifecycle_service_role_arn      = var.appversion_lifecycle_service_role_arn
  appversion_lifecycle_max_age_in_days       = var.appversion_lifecycle_max_age_in_days
  appversion_lifecycle_max_count             = var.appversion_lifecycle_max_count
  appversion_lifecycle_delete_source_from_s3 = var.appversion_lifecycle_delete_source_from_s3

  context = module.this.context
}
