output "elastic_beanstalk_application_name" {
  value       = try(aws_elastic_beanstalk_application.default[0].name, null)
  description = "Elastic Beanstalk Application name"
}

output "elastic_beanstalk_application_arn" {
  value       = try(aws_elastic_beanstalk_application.default[0].arn, null)
  description = "Elastic Beanstalk Application Arn"
}

output "appversion_lifecycle_service_role_arn" {
  value       = var.create_lifecycle_service_role ? aws_iam_role.default[0].arn : var.appversion_lifecycle_service_role_arn
  description = "Elastic Beanstalk Application Lifecycle Service Role Arn"
}

output "elastic_beanstalk_application_lifecycle_rules" {
  value       = try(aws_elastic_beanstalk_application.default[0].appversion_lifecycle, null)
  description = "Elastic Beanstalk Application Lifecycle Rules"
}
