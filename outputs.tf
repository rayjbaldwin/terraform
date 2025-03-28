output "ec2_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.web[*].public_ip
}

output "rds_endpoint" {
  description = "Endpoint of MySQL instance"
  value       = aws_db_instance.MySQL_instance.endpoint
}