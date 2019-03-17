# Define composite variables for resources
module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.1"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "${module.label.id}"
  description = "${var.description}"

  appversion_lifecycle {
    service_role          = "${var.appversion_lifecycle_service_role_arn}"
    max_count             = "${var.appversion_lifecycle_max_count}"
    delete_source_from_s3 = "${var.appversion_lifecycle_delete_source_from_s3}"
  }
}
