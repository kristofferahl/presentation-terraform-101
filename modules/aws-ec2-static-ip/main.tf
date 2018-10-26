provider "aws" {
  region  = "${var.region}"
  version = "~> 1.11"
}

resource "aws_instance" "example" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.instance_name}"
  }
}

resource "aws_eip" "example" {
  instance = "${aws_instance.example.id}"
  count = "${var.elastic_ip == true ? 1 : 0}"
}
