# modules/security/outputs.tf

output "alb_sg_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb.id
}

output "instance_sg_id" {
  description = "Instance Security Group ID"
  value       = aws_security_group.instance.id
}