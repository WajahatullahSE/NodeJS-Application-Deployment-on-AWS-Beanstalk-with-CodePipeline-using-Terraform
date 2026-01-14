# modules/codepipeline/main.tf

# S3 Bucket for Pipeline Artifacts
resource "aws_s3_bucket" "artifacts" {
  bucket = "${var.prefix}-pipeline-artifacts"

  tags = var.common_tags
}

# S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

# CodePipeline
resource "aws_codepipeline" "this" {
  name     = var.pipeline_name
  role_arn = var.pipeline_role_arn

  artifact_store {
    location = aws_s3_bucket.artifacts.bucket
    type     = "S3"
  }

  # Source Stage - GitHub
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github_connection_arn
        FullRepositoryId = var.github_repository_id
        BranchName       = var.branch_name
        DetectChanges    = "true"
      }
    }
  }

  # Build Stage - CodeBuild
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.codebuild_project
      }
    }
  }

  # Deploy Stage - Elastic Beanstalk
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ElasticBeanstalk"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ApplicationName = var.eb_app_name
        EnvironmentName = var.eb_environment_name
      }
    }
  }

  tags = var.common_tags
}