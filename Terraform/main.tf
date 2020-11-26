terraform {
  backend "remote" {
    organization = "jamesSandford"

    workspaces {
      name = "Infrastructure-WorkStream"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
}
module "Network" {
  source = "./Network"
  name   = var.name
  owner  = var.owner
}
module "CW" {
  source           = "./cloudwatch"
  name             = var.name
  owner            = var.owner
  loadbalancer_arn = module.Network.loadbalancer.arn_suffix
  scaling_policy   = module.ECS.scaling_policy.arn
}
module "ECS" {
  depends_on = [module.Network]
  source     = "./ECS"
  name       = var.name
  owner      = var.owner
  Repo_URL   = var.ECR_REPO
  subnets    = module.Network.subnet_public.*.id
  SecGroup   = module.Network.SecGroupAll.id
  lbTarget   = module.Network.lbTarget.arn
}