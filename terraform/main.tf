terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Platform    = "PlatformEngineeringHub"
    }
  }
}

resource "aws_vpc" "platform_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.environment}-platform-vpc"
  }
}

resource "aws_kms_key" "platform_key" {
  description             = "KMS Key for EKS Secrets and EBS Volume Encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}
