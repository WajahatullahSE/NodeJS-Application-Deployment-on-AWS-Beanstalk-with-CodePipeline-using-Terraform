# Node.js Application Deployment on AWS Elastic Beanstalk with CodePipeline

Terraform infrastructure for deploying a Node.js application on AWS Elastic Beanstalk with automated CI/CD using CodePipeline.

## Architecture


## Prerequisites

- AWS CLI configured
- Terraform installed
- GitHub connection established in AWS CodeStar Connections
- IAM roles created:
  - EB service role
  - EB instance profile
  - CodePipeline role
  - CodeBuild role
- S3 bucket with initial app version (v1.zip)

## Project Structure

```
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── provider.tf
├── backend.tf
└── modules/
    ├── vpc/
    ├── security/
    ├── elb/
    ├── codebuild/
    └── codepipeline/
```

## Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Review Plan**
   ```bash
   terraform plan
   ```

3. **Apply Configuration**
   ```bash
   terraform apply
   ```

4. **Get EB Environment URL**
   ```bash
   terraform output eb_environment_url
   ```

## How It Works

1. **Initial Deployment**: EB environment deploys using v1.zip from S3 bucket
2. **GitHub Push**: Code pushed to main branch triggers CodePipeline
3. **Build**: CodeBuild runs `npm install --production` and packages app
4. **Deploy**: Pipeline deploys built artifact to Elastic Beanstalk
5. **Rolling Update**: EB performs rolling deployment (50% batch size)

## Application Configuration

- **Port**: 8081 (injected via PORT environment variable)
- **Health Check**: HTTP on /
- **.ebextensions**: Environment variables configured in `.ebextensions/env_vars.config`

## Monitoring

- **Pipeline**: AWS Console → CodePipeline
- **EB Environment**: AWS Console → Elastic Beanstalk
- **Logs**: CloudWatch Logs (7-day retention)

## Cleanup

```bash
terraform destroy
```

**Note**: Manually delete S3 artifacts bucket if needed (contains pipeline artifacts).
