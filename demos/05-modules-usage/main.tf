module "my_vm" {
  source = "../05-modules"

  region        = "us-east-1"
  environment   = "production"
  instance_name = "hello-terraform"
  instance_type = "t2.nano"
}
