# output.tf
output "public_ips" {
  description = "The Public IP Address of the web server"
  value = aws_instance.web_server[*].public_ip
}

output "hostnames" {
  description = "The Public DNS of the web server"
  value = aws_instance.web_server[*].public_dns
  
}