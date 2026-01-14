# modules/codepipeline/outputs.tf

output "pipeline_name" {
  description = "Pipeline name"
  value       = aws_codepipeline.this.name
}

output "pipeline_arn" {
  description = "Pipeline ARN"
  value       = aws_codepipeline.this.arn
}

output "artifacts_bucket_name" {
  description = "Artifacts S3 bucket name"
  value       = aws_s3_bucket.artifacts.bucket
}

output "artifacts_bucket_arn" {
  description = "Artifacts S3 bucket ARN"
  value       = aws_s3_bucket.artifacts.arn
}