terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

# Pass valid AWS profile

provider "aws" {
  region  = var.region
}


terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Selfsign"

    workspaces {
      prefix = "terraform-"
    }
  }
}

