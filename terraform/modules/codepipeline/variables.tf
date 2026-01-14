# modules/codepipeline/variables.tf

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "pipeline_name" {
  description = "Pipeline name"
  type        = string
}

variable "pipeline_role_arn" {
  description = "CodePipeline IAM role ARN"
  type        = string
}

variable "github_connection_arn" {
  description = "GitHub connection ARN"
  type        = string
}

variable "github_repository_id" {
  description = "GitHub repository ID (owner/repo)"
  type        = string
}

variable "branch_name" {
  description = "Branch name"
  type        = string
}

variable "codebuild_project" {
  description = "CodeBuild project name"
  type        = string
}

variable "eb_app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "eb_environment_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}