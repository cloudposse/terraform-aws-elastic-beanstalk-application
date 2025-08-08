locals {
  # Remove `Name` tag from the map of tags because Elastic Beanstalk generates the `Name` tag automatically
  # and if it is provided, terraform tries to recreate the application on each `plan/apply`
  # `Namespace` should be removed as well since any string that contains `Name` forces recreation
  # https://github.com/terraform-providers/terraform-provider-aws/issues/3963
  tags                                  = { for t in keys(module.this.tags) : t => module.this.tags[t] if t != "Name" && t != "Namespace" }
  enabled                               = module.this.enabled
  partition                             = join("", data.aws_partition.current[*].partition)
  appversion_lifecycle_service_role_arn = var.create_lifecycle_service_role ? aws_iam_role.default[0].arn : var.appversion_lifecycle_service_role_arn
  appversion_lifecycle_max_age_in_days  = var.appversion_lifecycle_max_count == 200 ? var.appversion_lifecycle_max_age_in_days : null
  appversion_lifecycle_max_count        = local.appversion_lifecycle_max_age_in_days != null ? null : var.appversion_lifecycle_max_count
}

data "aws_partition" "current" {
  count = local.enabled ? 1 : 0
}

resource "aws_elastic_beanstalk_application" "default" {
  count       = local.enabled ? 1 : 0
  name        = module.this.id
  description = var.description
  tags        = local.tags

  dynamic "appversion_lifecycle" {
    for_each = local.appversion_lifecycle_service_role_arn != "" ? ["true"] : []
    content {
      service_role          = local.appversion_lifecycle_service_role_arn
      max_count             = local.appversion_lifecycle_max_count
      max_age_in_days       = local.appversion_lifecycle_max_age_in_days
      delete_source_from_s3 = var.appversion_lifecycle_delete_source_from_s3
    }
  }
}

data "aws_iam_policy_document" "service" {
  count = local.enabled && var.create_lifecycle_service_role ? 1 : 0

  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["elasticbeanstalk.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "default" {
  count = local.enabled && var.create_lifecycle_service_role ? 1 : 0

  name               = "${module.this.id}-eb-appversion-lifecycle-service"
  assume_role_policy = join("", data.aws_iam_policy_document.service[*].json)
  tags               = module.this.tags
}

resource "aws_iam_role_policy_attachment" "enhanced_health" {
  count = local.enabled && var.create_lifecycle_service_role ? 1 : 0

  role       = join("", aws_iam_role.default[*].name)
  policy_arn = "arn:${local.partition}:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_role_policy_attachment" "service" {
  count = local.enabled && var.create_lifecycle_service_role ? 1 : 0

  role       = join("", aws_iam_role.default[*].name)
  policy_arn = var.prefer_legacy_service_policy ? "arn:${local.partition}:iam::aws:policy/service-role/AWSElasticBeanstalkService" : "arn:${local.partition}:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
}
