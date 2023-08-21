module "ecr-repository" {
  source      = "../modules/ecr"
  name        = var.name
  project     = var.project
  environment = var.environment
  owner       = var.owner
}