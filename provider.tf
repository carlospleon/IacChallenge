terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

    backend "remote" {

    hostname     = "app.terraform.io"

    organization = "carlospleon"



    workspaces {

      name = "IacChallenge"

    }

  }
}

provider "aws" {
  region  = "us-east-1"
}
