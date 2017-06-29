# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/cloudposse/tf_label.git?ref=provider"
  provider  = "${var.provider}"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"
}

resource "aws_elastic_beanstalk_application" "default" {
  provider    = "${var.provider}"
  name        = "${module.label.id}"
  description = "${var.description}"
}
