output "vpc" {
  description = "The VPC."
  value       = module.vpc.vpc
}

output "vpc_public_subnets" {
  description = "The public subnets."
  value       = module.vpc.vpc_public_subnets
}

output "vpc_private_subnets" {
  description = "The private subnets."
  value       = module.vpc.vpc_private_subnets
}

output "tgw" {
  description = "The transit gateway associated with the VPC."
  value       = var.tgw != null ? module.tgw.tgw : null
}

output "vpx" {
  description = "The VPC peering connections."
  value       = length(var.vpc_peer) > 0 ? module.vpx.vpx[*] : []
}
