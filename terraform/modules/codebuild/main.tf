# modules/codebuild/main.tf

# CodeBuild Project
resource "aws_codebuild_project" "this" {
  name          = var.project_name
  service_role  = var.codebuild_role_arn
  build_timeout = var.build_timeout

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "ARTIFACTS_BUCKET"
      value = var.artifacts_bucket
    }
  }

source {
  type      = "CODEPIPELINE"
  buildspec = <<-EOF
    version: 0.2

    phases:
      install:
        runtime-versions:
          nodejs: ${var.nodejs_version}
        commands:
          - echo "Installing Node.js ${var.nodejs_version}..."

      pre_build:
        commands:
          - echo "Installing dependencies..."
          - npm install --production
          - echo "Trimming Procfile..."
          - sed -i 's/[[:space:]]*$//' Procfile  # Remove trailing spaces/lines
          - cat Procfile  # Debug: Print the Procfile to logs

      build:
        commands:
          - echo "Build completed on $(date)"

      post_build:
        commands:
          - echo "Preparing artifact for Elastic Beanstalk..."

    artifacts:
      files:
        - '**/*'
      discard-paths: no  # Preserve directory structure
  EOF
}

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }

  tags = var.common_tags
}