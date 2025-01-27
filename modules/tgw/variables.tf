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
variable "tgw" {
  description = "The ID of the external transit gateway to associate with a VPC."
  type        = string
}

variable "tgw_route" {
  description = "The route (CIDR) to associate with the transite gateway."
  type        = string
}

variable "vpc" {
  description = "The ID of the VPC."
  type        = string
}

variable "vpc_subnets" {
  type        = number
  nullable    = true
  default     = null
  description = "The number of public-private subnet pairs to create. Cannot be greater than the number of AZ in this region."
}
