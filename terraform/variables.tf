variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS target deployment region"
}

variable "environment" {
  type        = string
  default     = "production"
  description = "Deployment target environment stage"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base network CIDR block"
}
