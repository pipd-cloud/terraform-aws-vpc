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

variable "vpx" {
  description = "The ID of the VPC to peer with the main VPC."
  type        = string
}
