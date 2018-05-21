variable "region" {
  description = "AWS region to use"
}

variable "namespace" {
  description = "Namespace for configuration"
}

provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.31.0"

  name = "${var.namespace}-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["${data.aws_availability_zones.available.names[0]}"]
  public_subnets = ["10.0.1.0/24"]

  tags = {
    Namespace = "${var.namespace}"
  }
}

output "vpc_id" {
  description = "VPC ID"
  value       = "${module.vpc.vpc_id}"
}

output "public_subnets" {
  description = "Public Subnet IDs"
  value       = "${module.vpc.public_subnets}"
}
