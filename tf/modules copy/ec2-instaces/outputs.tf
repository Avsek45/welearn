output "public_ips" {
  description = "The public IP addresses of the launched instances."
  value       = aws_instance.ec2.*.public_ip
}
