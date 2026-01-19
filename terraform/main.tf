# main.tf - Define resources

# S3 bucket for storing artifacts
resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.app_name}-${var.environment}-artifacts"

  tags = {
    Name        = "${var.app_name}-artifacts"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "app_bucket_versioning" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ECR repository for Docker images
resource "aws_ecr_repository" "app_repo" {
  name                 = "${var.app_name}-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = var.app_name
    Environment = var.environment
  }
}
