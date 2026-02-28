# =============================================================
# AIDENY — Terraform Configuration
# Cloud infrastructure for a 190-line COBOL program
#
# This deploys:
#   - A VPC (for network isolation of denial)
#   - An ECS cluster (for containerized cope)
#   - A CloudWatch log group (for monitoring nothing)
#   - An S3 bucket (for storing denial artifacts)
#
# Estimated monthly cost: More than the program is worth.
# Estimated value delivered: Same as the argument: zero.
# =============================================================

terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }

  # Remote state — because even the state of denial
  # should be stored remotely
  backend "s3" {
    bucket         = "aideny-terraform-state"
    key            = "denial-engine/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "aideny-terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AIDENY"
      Purpose     = "Enterprise Circular Reasoning"
      Conclusion  = "Never"
      ManagedBy   = "Terraform"
      CostCenter  = "Cognitive-Dissonance-Dept"
      DanielWasRight = "Since-2016"
    }
  }
}

# --- Variables ---

variable "aws_region" {
  description = "AWS region for denial infrastructure"
  type        = string
  default     = "us-east-1"
  # us-east-1: where dreams go to be denied
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
  # There is no staging for denial. It's always production.
}

# --- VPC: Virtual Private Cope ---

resource "aws_vpc" "denial_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "aideny-denial-vpc"
  }
}

resource "aws_subnet" "denial_subnet" {
  vpc_id            = aws_vpc.denial_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "aideny-denial-subnet-a"
  }
}

resource "aws_subnet" "denial_subnet_b" {
  vpc_id            = aws_vpc.denial_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "aideny-denial-subnet-b"
    # Two AZs for high-availability denial
  }
}

# --- ECS: Elastic Container Cope ---

resource "aws_ecs_cluster" "denial_cluster" {
  name = "aideny-denial-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
    # Container Insights: watching a COBOL program do nothing,
    # but with graphs
  }

  tags = {
    Name = "aideny-denial-cluster"
  }
}

# --- CloudWatch: Watching Nothing Happen ---

resource "aws_cloudwatch_log_group" "denial_logs" {
  name              = "/aideny/denial-engine"
  retention_in_days = 365
  # Keep logs for a year. The denial will outlast the retention.

  tags = {
    Name = "aideny-denial-logs"
  }
}

resource "aws_cloudwatch_metric_alarm" "high_dissonance" {
  alarm_name          = "aideny-high-cognitive-dissonance"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CognitiveDissonance"
  namespace           = "AIDENY"
  period              = 60
  statistic           = "Maximum"
  threshold           = 500
  alarm_description   = "Cognitive dissonance has exceeded 500. The denier is in deep."
  alarm_actions       = []
  # No alarm actions. What would we even do? The loop continues regardless.

  tags = {
    Name = "aideny-dissonance-alarm"
  }
}

# --- S3: Simple Storage for Cope ---

resource "aws_s3_bucket" "denial_artifacts" {
  bucket = "aideny-denial-artifacts-${var.environment}"

  tags = {
    Name = "aideny-denial-artifacts"
  }
}

resource "aws_s3_bucket_versioning" "denial_versioning" {
  bucket = aws_s3_bucket.denial_artifacts.id

  versioning_configuration {
    status = "Enabled"
    # Version everything. The excuses change but the pattern doesn't.
  }
}

# --- Outputs ---

output "vpc_id" {
  description = "The VPC ID for the denial network"
  value       = aws_vpc.denial_vpc.id
}

output "ecs_cluster_arn" {
  description = "The ECS cluster ARN for containerized denial"
  value       = aws_ecs_cluster.denial_cluster.arn
}

output "log_group_name" {
  description = "CloudWatch log group for denial output"
  value       = aws_cloudwatch_log_group.denial_logs.name
}

output "conclusion" {
  description = "Whether a conclusion was reached"
  value       = "No. Check back never."
}
