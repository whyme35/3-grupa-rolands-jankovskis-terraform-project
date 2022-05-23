variable "region" {
  description = "The region to launch the bastion host"
}

variable "name" {
  description = "Name"
}
variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}
variable "environment" {
  description = "The Deployment environment"
}


variable "instance_type" {
  description = "The Instance Type"
}

variable "subnet_id" {
  description = "The az that the resources will be launched"
}
variable "private_subnet_id" {
  description = "The az that the resources will be launched"
}

variable "vpc_security_group_idsc"{

description = "value"
}
variable "vpcid" {
  description = "ID of the VPC in which security resources are deployed"
  type = string
}