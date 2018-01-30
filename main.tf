variable "region" {
  description = "AWS region to use"
}

variable "config_name" {
  description = "Unique configuration name"
}

provider "aws" {
  region = "${var.region}"
}

module "simple_network" {
  source  = "dan-ptfe.hashidemos.io/bank/simple_network/aws"
  version = "0.2.1"
  
  config_name = "${var.config_name}"
}

output "vpc_id" {
  description = "VPC ID"
  value       = "${module.simple_network.vpc_id}"
}

output "subnet_id" {
  description = "Subnet ID"
  value       = "${module.simple_network.subnet_id}"
}

output "availability_zone" {
  description = "Availability Zone"
  value       = "${module.simple_network.availability_zone}"
}
