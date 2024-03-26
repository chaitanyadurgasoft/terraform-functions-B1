output "vpc_id" {
  value = aws_vpc.terraformb1.id
}
output "public_subnet_1" {
  value = aws_subnet.public_subnet.0.id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet.1.id
}

output "public_subnet_3" {
  value = aws_subnet.public_subnet.2.id
}

output "private_subnet_1" {
  value = aws_subnet.private_subnet.0.id
}
output "private_subnet_2" {
  value = aws_subnet.private_subnet.1.id
}
output "private_subnet_3" {
  value = aws_subnet.private_subnet.2.id
}

output "WebserversPublicIp" {
  value = aws_instance.WebServer.*.public_ip
}