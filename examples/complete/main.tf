provider "aws" {
  region = var.region
}

module "app" {
  source    = "../../"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}
