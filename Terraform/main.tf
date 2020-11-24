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
module "ECR" {
  source = "./ECR"
  name   = var.name
  owner  = var.owner
}
module "ECS" {
  source   = "./ECS"
  name     = var.name
  owner    = var.owner
  Repo_URL = module.ECR.repo_url
  subnets  = list(module.Network.subnet_public.id)
  SecGroup = module.Network.SecGroupAll.id
}