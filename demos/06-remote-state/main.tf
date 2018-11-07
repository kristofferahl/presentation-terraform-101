terraform {
  backend "s3" {
    bucket = "terraform-101-remote-state"
    key    = "path/to/state"
    region = "us-east-1"
  }
}

module "my_vm" {
  source = "../05-modules"

  region        = "us-east-1"
  environment   = "production"
  instance_name = "hello-terraform"
  instance_type = "t2.nano"
}
