# Root main.tf 

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  prefix          = var.prefix
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  common_tags     = var.common_tags
}

# Security Groups Module
module "security" {
  source = "./modules/security"

  prefix      = var.prefix
  vpc_id      = module.vpc.vpc_id
  common_tags = var.common_tags
}

# Elastic Beanstalk Module
module "elb" {
  source = "./modules/elb"

  prefix                = var.prefix
  app_name              = var.eb_app_name
  environment_name      = var.eb_environment_name
  solution_stack        = var.solution_stack
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  private_subnet_ids    = module.vpc.private_subnet_ids
  alb_sg_id             = module.security.alb_sg_id
  instance_sg_id        = module.security.instance_sg_id
  service_role_arn      = var.service_role_arn
  instance_profile      = var.instance_profile
  instance_type         = var.instance_type
  min_size              = var.min_size
  max_size              = var.max_size
  s3_bucket             = var.s3_bucket
  s3_key                = var.s3_key
  app_port              = var.app_port
  common_tags           = var.common_tags
}

# CodeBuild Module
module "codebuild" {
  source = "./modules/codebuild"

  prefix             = var.prefix
  project_name       = var.codebuild_project_name
  codebuild_role_arn = var.codebuild_role_arn
  artifacts_bucket   = module.codepipeline.artifacts_bucket_name
  nodejs_version     = var.nodejs_version
  build_timeout      = var.build_timeout
  common_tags        = var.common_tags
}

# CodePipeline Module
module "codepipeline" {
  source = "./modules/codepipeline"

  prefix                = var.prefix
  pipeline_name         = var.pipeline_name
  pipeline_role_arn     = var.pipeline_role_arn
  github_connection_arn = var.github_connection_arn
  github_repository_id  = var.github_repository_id
  branch_name           = var.branch_name
  codebuild_project     = module.codebuild.project_name
  eb_app_name           = module.elb.application_name
  eb_environment_name   = module.elb.environment_name
  common_tags           = var.common_tags
}