# Define composite variables for resources
resource "null_resource" "default" {
  triggers = {
    id = "${lower(format("%v-%v-%v", var.namespace, var.stage, var.name))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "${null_resource.default.triggers.id}"
  description = "${var.description}"
}
