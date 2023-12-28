output "web_server_public_ip" {
  value = aws_instance.web_server_assignment4.public_ip
}

output "database_private_ip" {
  value = aws_instance.database_assignment4.private_ip
}