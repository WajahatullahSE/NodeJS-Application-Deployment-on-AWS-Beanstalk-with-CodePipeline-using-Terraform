# Root outputs.tf - Key outputs

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eb_application_name" {
  description = "Elastic Beanstalk application name"
  value       = module.elb.application_name
}

output "eb_environment_name" {
  description = "Elastic Beanstalk environment name"
  value       = module.elb.environment_name
}

output "eb_environment_url" {
  description = "Elastic Beanstalk environment URL"
  value       = module.elb.environment_url
}

output "codebuild_project_name" {
  description = "CodeBuild project name"
  value       = module.codebuild.project_name
}

output "codepipeline_name" {
  description = "CodePipeline name"
  value       = module.codepipeline.pipeline_name
}

output "artifacts_bucket" {
  description = "Pipeline artifacts S3 bucket"
  value       = module.codepipeline.artifacts_bucket_name
}