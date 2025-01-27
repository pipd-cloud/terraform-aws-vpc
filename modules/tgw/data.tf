locals {
  vpc_subnets = var.vpc_subnets == null ? length(data.aws_availability_zones.az.names) : var.vpc_subnets
}

data "aws_availability_zones" "az" {}

data "aws_ec2_transit_gateway" "external" {
  id = var.tgw
}

data "aws_vpc" "main" {
  id = var.vpc
}

data "aws_subnets" "vpc" {
  filter {
    name   = "vpi-id"
    values = [data.aws_vpc.main.id]
  }
}

data "aws_route_tables" "vpc" {
  vpc_id = data.aws_vpc.main.id
}
