variable "region" {
  description = "The region to place the instance in"
}

variable "instance_name" {
  description = "The name of the VM"
}

variable "instance_ami" {
  default = "ami-2757f631"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "elastic_ip" {
  default = true
}
