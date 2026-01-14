# modules/elb/variables.tf

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "environment_name" {
  description = "Environment name"
  type        = string
}

variable "solution_stack" {
  description = "Solution stack name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EC2 instances"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}

variable "instance_sg_id" {
  description = "Instance Security Group ID"
  type        = string
}

variable "service_role_arn" {
  description = "Service role ARN"
  type        = string
}

variable "instance_profile" {
  description = "Instance profile name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "min_size" {
  description = "Minimum instances"
  type        = number
}

variable "max_size" {
  description = "Maximum instances"
  type        = number
}

variable "s3_bucket" {
  description = "S3 bucket for initial version"
  type        = string
}

variable "s3_key" {
  description = "S3 key for initial version"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}