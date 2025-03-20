module "vpc" {
  source              = "./modules/vpc"
  id                  = var.id
  aws_tags            = var.aws_tags
  bucket_name         = var.vpc_flow_logs_bucket
  vpc_network_address = var.vpc_network_address
  vpc_network_mask    = var.vpc_network_mask
  vpc_subnet_new_bits = var.vpc_subnet_new_bits
  vpc_subnets         = var.vpc_subnets
  nat                 = var.vpc_nat
  nat_multi_az        = var.vpc_nat_multi_az
}

module "tgw" {
  count       = var.tgw != null ? 1 : 0
  source      = "./modules/tgw"
  id          = var.id
  aws_tags    = var.aws_tags
  vpc         = module.vpc.vpc.id
  vpc_subnets = var.vpc_subnets
  tgw         = var.tgw
  tgw_route   = var.tgw_route
}

module "vpx" {
  count       = length(var.vpc_peer)
  source      = "./modules/vpx"
  id          = var.id
  aws_tags    = var.aws_tags
  vpc         = module.vpc.vpc.id
  vpc_subnets = var.vpc_subnets
  vpx         = var.vpc_peer[count.index]
}

module "vpx_external" {
  for_each = var.vpc_peer_external
  source = "./modules/vpx"
  id     = var.id
  aws_tags = var.aws_tags
  vpc = module.vpc.vpc.id
  vpc_subnets = var.vpc_subnets
  vpx = each.value
  vpx_owner_id = each.key
}
