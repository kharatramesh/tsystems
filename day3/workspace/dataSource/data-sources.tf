terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# ==============================================================================
# 20 TERRAFORM DATA SOURCES
# ==============================================================================

# --- AWS IDENTITY & CORE INFRASTRUCTURE (1–5) ---

# 1. Get current AWS Account ID and ARN
data "aws_caller_identity" "current" {}

# 2. Get current AWS Region metadata
data "aws_region" "current" {}

# 3. Fetch list of available Availability Zones in the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# 4. Fetch details of the Default VPC
data "aws_vpc" "default" {
  default = true
}

# 5. Fetch subnets associated with the Default VPC
data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# --- AWS COMPUTE & STORAGE (6–10) ---

# 6. Fetch the latest official Amazon Linux 2023 AMI ID
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# 7. Fetch an existing S3 Bucket by name
data "aws_s3_bucket" "existing_bucket" {
  bucket = "my-company-existing-logs-bucket"
}

# 8. Fetch an existing Security Group by name filter
data "aws_security_group" "web_sg" {
  filter {
    name   = "group-name"
    values = ["web-server-sg"]
  }
}

# 9. Fetch an existing IAM Role by name
data "aws_iam_role" "lambda_exec" {
  name = "lambda-execution-role"
}

# 10. Generate an IAM Policy Document (Data source used to construct dynamic JSON policies)
data "aws_iam_policy_document" "s3_read_access" {
  statement {
    actions   = ["s3:GetObject", "s3:ListBucket"]
    resources = ["arn:aws:s3:::my-company-existing-logs-bucket/*"]
  }
}

# --- AWS NETWORKING & SECURITY (11–15) ---

# 11. Fetch an ACM TLS/SSL Certificate details
data "aws_acm_certificate" "domain_cert" {
  domain   = "example.com"
  statuses = ["ISSUED"]
}

# 12. Fetch a Route53 Public Hosted Zone ID
data "aws_route53_zone" "primary" {
  name         = "example.com."
  private_zone = false
}

# 13. Fetch secret metadata/value from AWS Secrets Manager
data "aws_secretsmanager_secret" "db_secret" {
  name = "production/db/credentials"
}

# 14. Fetch a parameter value from Systems Manager (SSM) Parameter Store
data "aws_ssm_parameter" "db_port" {
  name = "/config/database/port"
}

# 15. Fetch an existing KMS Key by Alias
data "aws_kms_alias" "s3_key" {
  name = "alias/aws/s3"
}

# --- GENERIC & UTILITY PROVIDER DATA SOURCES (16–20) ---

# 16. Fetch external IP address / Web endpoint data via HTTP
data "http" "my_public_ip" {
  url = "https://checkip.amazonaws.com"
}

# 17. Inspect/Fetch a TLS certificate from a remote endpoint
data "tls_certificate" "github" {
  url = "https://github.com"
}

# 18. Create a ZIP archive file on the fly from inline source code
data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${path.module}/lambda.zip"

  source {
    content  = "exports.handler = async () => 'Hello World';"
    filename = "index.js"
  }
}

# 19. Read a local file content into Terraform memory
data "local_file" "readme" {
  filename = "${path.module}/main.tf"
}

# 20. Execute an external script (Python, Bash, Node.js) and capture JSON output
data "external" "system_info" {
  program = ["python3", "-c", "import json, platform; print(json.dumps({'os': platform.system()}))"]
}

# ==============================================================================
# OUTPUTS
# ==============================================================================
output "aws_identity_data" {
  value = {
    "1_account_id"       = data.aws_caller_identity.current.account_id
    "2_current_region"   = data.aws_region.current.name
    "3_avail_zones"      = data.aws_availability_zones.available.names
    "4_default_vpc_id"   = data.aws_vpc.default.id
    "5_default_subnets"  = data.aws_subnets.default_vpc_subnets.ids
  }
}

output "aws_compute_storage_data" {
  value = {
    "6_latest_ami_id"    = data.aws_ami.amazon_linux_2023.id
    "7_s3_bucket_arn"    = data.aws_s3_bucket.existing_bucket.arn
    "8_security_group_id"= data.aws_security_group.web_sg.id
    "9_iam_role_arn"     = data.aws_iam_role.lambda_exec.arn
    "10_iam_policy_json" = data.aws_iam_policy_document.s3_read_access.json
  }
}

output "aws_network_security_data" {
  value = {
    "11_acm_cert_arn"    = data.aws_acm_certificate.domain_cert.arn
    "12_route53_zone_id" = data.aws_route53_zone.primary.zone_id
    "13_secret_arn"      = data.aws_secretsmanager_secret.db_secret.arn
    "14_ssm_param_arn"   = data.aws_ssm_parameter.db_port.arn
    "15_kms_key_arn"     = data.aws_kms_alias.s3_key.target_key_arn
  }
}

output "utility_providers_data" {
  value = {
    "16_runner_public_ip"= trimspace(data.http.my_public_ip.response_body)
    "17_tls_cert_issuer" = data.tls_certificate.github.certificates[0].issuer
    "18_zip_sha256"      = data.archive_file.lambda_zip.output_base64sha256
    "19_local_file_size" = length(data.local_file.readme.content)
    "20_external_os_info"= data.external.system_info.result["os"]
  }
}