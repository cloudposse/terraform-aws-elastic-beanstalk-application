output "elastic_beanstalk_application_name" {
  value       = aws_elastic_beanstalk_application.default[*].name
  description = "Elastic Beanstalk Application name"
}

output "elastic_beanstalk_application_arn" {
  value       = aws_elastic_beanstalk_application.default[*].arn
  description = "Elastic Beanstalk Application Arn"
}

output "appversion_lifecycle_service_role_arn" {
  value       = var.create_lifecycle_service_role ? aws_iam_role.default[0].arn : var.appversion_lifecycle_service_role_arn
  description = "Elastic Beanstalk Application Lifecycle Service Role Arn"
}

output "elastic_beanstalk_application_lifecycle_rules" {
  value       = aws_elastic_beanstalk_application.default[*].appversion_lifecycle
  description = "Elastic Beanstalk Application Lifecycle Rules"
}
