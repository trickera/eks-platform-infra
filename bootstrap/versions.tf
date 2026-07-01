terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.53"
    }
  }
}

# State local de propósito: este stack cria o bucket que guarda o state do
# resto, então não há backend remoto pra ele apontar ainda.
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = var.project
      ManagedBy = "terraform"
      Component = "tf-backend"
    }
  }
}
