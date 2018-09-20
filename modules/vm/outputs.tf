output "private_ip" {
  value = "${aws_eip.example.*.private_ip}"
}

output "public_ip" {
  value = "${aws_eip.example.*.public_ip}"
}
