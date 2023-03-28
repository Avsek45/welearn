output "public_ips" {
  description = "The public IP addresses of the launched instances."
  value       = aws_instance.example.*.public_ip
}
