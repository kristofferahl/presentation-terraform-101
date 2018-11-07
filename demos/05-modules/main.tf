provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name        = "${var.instance_name}"
    Environment = "${var.environment}"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
