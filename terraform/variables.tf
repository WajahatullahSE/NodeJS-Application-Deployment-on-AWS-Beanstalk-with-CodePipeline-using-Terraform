# Root variables.tf - Variable definitions

variable "region" {
  description = "AWS region"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

# Elastic Beanstalk Variables
variable "eb_app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "eb_environment_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack" {
  description = "Elastic Beanstalk solution stack"
  type        = string
}

variable "service_role_arn" {
  description = "ARN of EB service role"
  type        = string
}

variable "instance_profile" {
  description = "IAM instance profile for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "s3_bucket" {
  description = "S3 bucket containing initial application version"
  type        = string
}

variable "s3_key" {
  description = "S3 key for initial application version"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

# CodeBuild Variables
variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
}

variable "codebuild_role_arn" {
  description = "ARN of CodeBuild service role"
  type        = string
}

variable "nodejs_version" {
  description = "Node.js version for CodeBuild"
  type        = string
}

variable "build_timeout" {
  description = "Build timeout in minutes"
  type        = number
}

# CodePipeline Variables
variable "pipeline_name" {
  description = "CodePipeline name"
  type        = string
}

variable "pipeline_role_arn" {
  description = "ARN of CodePipeline service role"
  type        = string
}

variable "github_connection_arn" {
  description = "ARN of GitHub connection"
  type        = string
}

variable "github_repository_id" {
  description = "GitHub repository ID (format: owner/repo)"
  type        = string
}

variable "branch_name" {
  description = "GitHub branch name"
  type        = string
}