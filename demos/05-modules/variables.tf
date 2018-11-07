variable "region" {
  description = "The region to place the instance in"
}

variable "environment" {
  description = "The environment tag applied to any resources created"
}

variable "instance_name" {
  description = "The name of the instance"
}

variable "instance_ami" {
  default = "ami-2757f631"
}

variable "instance_type" {
  default = "t2.small"
}
