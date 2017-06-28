# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/cloudposse/tf_label.git?ref=init"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "${module.label.id}"
  description = "${var.description}"
}
