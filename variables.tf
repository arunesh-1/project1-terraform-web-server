variable "aws_region" {
  description = "AWS region containing the default VPC."
  type        = string
  default     = "ap-south-1"
}

variable "subnet_cidr" {
  description = "Unused IPv4 CIDR within the default VPC."
  type        = string
}
