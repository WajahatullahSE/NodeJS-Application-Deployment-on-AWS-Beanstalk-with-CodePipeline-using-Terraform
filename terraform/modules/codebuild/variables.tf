# modules/codebuild/variables.tf

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "project_name" {
  description = "CodeBuild project name"
  type        = string
}

variable "codebuild_role_arn" {
  description = "CodeBuild IAM role ARN"
  type        = string
}

variable "artifacts_bucket" {
  description = "S3 bucket for artifacts"
  type        = string
}

variable "nodejs_version" {
  description = "Node.js version"
  type        = string
}

variable "build_timeout" {
  description = "Build timeout in minutes"
  type        = number
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}