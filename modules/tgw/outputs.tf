output "tgw" {
  value       = data.aws_ec2_transit_gateway.external
  description = "The transit gateway associated with the VPC."
}
