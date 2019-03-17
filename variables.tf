variable "name" {
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "description" {
  default     = ""
  description = "Description"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "appversion_lifecycle_service_role_arn" {
  description = "The service role ARN to use for application version cleanup"
}

variable "appversion_lifecycle_max_count" {
  default     = 1000
  description = "The max number of application versions to keep"
}

variable "appversion_lifecycle_delete_source_from_s3" {
  default     = "false"
  description = "Delete application versions from S3 source"
}
