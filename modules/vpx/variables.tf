# Common Variables
## Required
variable "id" {
  description = "The unique identifier for this deployment."
  type        = string
}

## Optional
variable "aws_tags" {
  description = "Additional AWS tags to apply to resources in this module."
  type        = map(string)
  default     = {}
}

# Module Variables
## Required
variable "vpc" {
  description = "The ID of the main VPC"
  type        = string
}

variable "vpc_subnets" {
  type        = number
  nullable    = true
  default     = null
  description = "The number of public-private subnet pairs to create. Cannot be greater than the number of AZ in this region."
}

variable "vpx" {
  description = "The ID of the VPC to peer with the main VPC."
  type        = string
}
