provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraformd63"
    key    = "ami/frontend/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source      = "git::https://github.com/priyankapeelu/tf-module-immutable-ami.git"
  COMPONENT   = "frontend"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}
