provider "aws" {
  region = "eu-west-2"
}

module "ECR" {
  source = "./ECR"
  name   = "James-Nick"
  owner  = "James-Nick"
}