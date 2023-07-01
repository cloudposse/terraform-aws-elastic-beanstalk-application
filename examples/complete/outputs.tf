output "elastic_beanstalk_application_name" {
  value       = module.elastic_beanstalk_application.elastic_beanstalk_application_name
  description = "Elastic Beanstalk Application name"
}

output "elastic_beanstalk_application_arn" {
  value       = module.elastic_beanstalk_application.elastic_beanstalk_application_arn
  description = "Elastic Beanstalk Application Arn"
}

output "appversion_lifecycle_service_role_arn" {
  value       = module.elastic_beanstalk_application.appversion_lifecycle_service_role_arn
  description = "Elastic Beanstalk Application Lifecycle Service Role Arn"
}

output "elastic_beanstalk_application_lifecycle_rules" {
  value       = module.elastic_beanstalk_application.elastic_beanstalk_application_lifecycle_rules
  description = "Elastic Beanstalk Application Arn"
}
