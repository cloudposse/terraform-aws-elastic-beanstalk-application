variable "region" {
  type        = string
  description = "AWS region"
}

variable "description" {
  type        = string
  description = "Elastic Beanstalk Application description"
}

variable "appversion_lifecycle_max_count" {
  type        = number
  description = "The max number of application versions to keep"
}

variable "appversion_lifecycle_max_age_in_days" {
  type        = number
  description = "The number of days to retain an application version (cannot be enabled simultaneously with appversion_lifecycle_max_count)"
}

variable "create_lifecycle_service_role" {
  type        = bool
  description = "Whether to create service role for application version cleanup. If set, `appversion_lifecycle_service_role_arn` will be ignored"
}

variable "appversion_lifecycle_delete_source_from_s3" {
  type        = bool
  description = "Whether to delete application versions from S3 source lifecycle max_count"
}

variable "appversion_lifecycle_service_role_arn" {
  type        = string
  description = "The service role ARN to use for application version cleanup. If left empty, the `appversion_lifecycle` block will not be created"
}
