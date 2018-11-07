provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name        = "hello-terraform"
    Environment = "production"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
