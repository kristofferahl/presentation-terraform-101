output "instance_name" {
  value = "${aws_instance.example.tags.Name}"
}

output "private_ip" {
  value = "${aws_eip.ip.private_ip}"
}

output "public_ip" {
  value = "${aws_eip.ip.public_ip}"
}
