variable "env" {
    type                = string
    description         = "Name of the environment being deployed to"
}

variable "vpc_cidr_block" {
    type                = string
    description         = "CIDR range for the VPC"
}

variable "flow_logs_bucket_name" {
    type                = string
    description         = "Name of the s3 bucket to create to save VPC flow logs in"
}

variable "default_tags" {
    type                = map(string)
    description         = "Set of default tags to apply to all resources"
}