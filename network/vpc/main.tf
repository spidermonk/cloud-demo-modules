resource "aws_vpc" "main" {
    cidr_block              = var.vpc_cidr_block
    enable_dns_support      = true
    enable_dns_hostnames    = true
    tags                    = merge(var.default_tags, {
        Name = "main-${var.env}"
    })
}

resource "aws_s3_bucket" "flow_logs" {
    bucket                  = var.flow_logs_bucket_name
    force_destroy           = true
    tags                    = merge(var.default_tags, {
        Name = var.flow_logs_bucket_name
    })
}

resource "aws_s3_bucket_public_access_block" "flow_logs" {
    bucket                  = aws_s3_bucket.flow_logs.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "flow_logs" {
    bucket                  = aws_s3_bucket.flow_logs.id
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm       = "AES256"
      }
    }
}

resource "aws_flow_log" "vpc_main" {
    log_destination         = aws_s3_bucket.flow_logs.arn
    log_destination_type    = "s3"
    traffic_type            = "ALL"
    vpc_id                  = aws_vpc.main.id
    destination_options {
      file_format           = "parquet"
      per_hour_partition    = true
    }
    tags                    = merge(var.default_tags, {
        Name = "main-vpc-flow-logs-${var.env}"
    })
}