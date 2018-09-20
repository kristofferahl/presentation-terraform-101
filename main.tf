terraform {
  backend "s3" {
    bucket = "terraform-remote-state-lab"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "my_vm" {
  source = "./modules/vm"

  region        = "${var.region}"
  instance_name = "${terraform.workspace}-vm-kristofferahl"
  instance_type = "t2.nano"
  elastic_ip    = false
}
