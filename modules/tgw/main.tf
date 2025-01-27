resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  transit_gateway_id                 = data.aws_ec2_transit_gateway.external.id
  vpc_id                             = data.aws_vpc.main.id
  subnet_ids                         = keys(data.aws_subnets.all)
  dns_support                        = "enable"
  security_group_referencing_support = "enable"
  tags = merge({
    Name = "${var.id}-${data.aws_ec2_transit_gateway.external.id}-vpc-attachment"
    TFID = var.id
  }, var.aws_tags)
}

resource "aws_route" "tgw" {
  # 1 route table for the public subnets
  # N route tables for the private subnets
  # 1 main route table
  count                  = local.vpc_subnets + 2
  route_table_id         = data.aws_route_tables.vpc.ids[count.index]
  transit_gateway_id     = data.aws_ec2_transit_gateway.external.id
  destination_cidr_block = var.tgw_route
}
