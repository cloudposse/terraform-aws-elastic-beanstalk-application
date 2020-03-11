variable "environment" {
  type        = string
  description = "Environment, in which resource will be deployed, e.g. 'uat' or 'prod' or 'staging'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
  default     = ""
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'cluster'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "description" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk Application description"
}

/* variable "application_version_name" {
  type        = string
  description = "Application version name"
}

variable "application_version_description" {
  type        = string
  description = "Application version description"
}

variable "application_version_s3_bucket" {
  type        = string
  description = "S3 bucket name"
}

variable "application_version_s3_bucket_object" {
  type        = string
  description = "Oject name in S3 bucket"
} */
