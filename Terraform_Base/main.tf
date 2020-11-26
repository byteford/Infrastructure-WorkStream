terraform {
  backend "remote" {
    organization = "jamesSandford"

    workspaces {
      name = "Infrastructer_base"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
}

module "ECR" {
  source = "./ECR"
  name   = var.name
  owner  = var.owner
}
