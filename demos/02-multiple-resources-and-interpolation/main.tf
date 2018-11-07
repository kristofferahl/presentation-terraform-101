provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ae682b6002e9bfc5"
  instance_type = "t2.micro"

  tags {
    Name        = "hello-terraform"
    Environment = "production"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
