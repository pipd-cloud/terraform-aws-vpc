locals {
  vpc_subnets = var.vpc_subnets == null ? length(data.aws_availability_zones.az.names) : var.vpc_subnets
}

data "aws_availability_zones" "az" {}

data "aws_vpc" "vpc" {
  id = var.vpc
}

data "aws_vpc" "vpx" {
  id = var.vpx
}

data "aws_subnets" "vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnets" "vpx" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpx.id]
  }
}

data "aws_route_tables" "vpc" {
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_route_tables" "vpx" {
  vpc_id = data.aws_vpc.vpx.id
}
