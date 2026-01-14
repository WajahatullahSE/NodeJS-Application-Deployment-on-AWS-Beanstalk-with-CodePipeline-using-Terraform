# modules/elb/outputs.tf

output "application_name" {
  description = "EB application name"
  value       = aws_elastic_beanstalk_application.this.name
}

output "environment_name" {
  description = "EB environment name"
  value       = aws_elastic_beanstalk_environment.this.name
}

output "environment_url" {
  description = "EB environment URL"
  value       = aws_elastic_beanstalk_environment.this.endpoint_url
}

output "environment_id" {
  description = "EB environment ID"
  value       = aws_elastic_beanstalk_environment.this.id
}