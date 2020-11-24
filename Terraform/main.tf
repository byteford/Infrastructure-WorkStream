provider "aws" {
  region = "eu-west-2"
}

module "ECR" {
  source = "./ECR"
  name   = "james-nick"
  owner  = "James-Nick"
}