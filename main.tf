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
  tags        = "${module.label.tags}"
  # because of https://github.com/terraform-providers/terraform-provider-aws/issues/3963
  lifecycle {
    ignore_changes = ["tags"]
  }
}
