module "ec2-instance" {
  source      = "../modules/ec2"
  name        = var.name
  project     = var.project
  environment = var.environment
  owner       = var.owner
}
