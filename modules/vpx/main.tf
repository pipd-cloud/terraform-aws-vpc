resource "aws_vpc_peering_connection" "vpx" {
  peer_owner_id = var.vpx_owner_id
  vpc_id      = data.aws_vpc.vpc.id
  peer_vpc_id = data.aws_vpc.vpx.id
  auto_accept = true
  tags = merge(
    {
      Name = var.vpx_owner_id == null ? "${var.id}-vpc-vpx-${data.aws_vpc.vpx.id}" : "${var.id}-vpc-vpx-${data.aws_vpc.vpx.id}-${var.vpx_owner_id}"
      TFID = var.id
  }, var.aws_tags)
}

resource "aws_route" "vpc" {
  # 1 route table for the public subnets
  # N route tables for the private subnets
  # 1 main route table
  count                     = local.vpc_subnets + 2
  route_table_id            = data.aws_route_tables.vpc.ids[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpx.cidr_block
}

resource "aws_route" "vpx" {
  for_each                  = var.vpx_owner_id == null ? toset(data.aws_route_tables.vpx.ids) : toset([])
  route_table_id            = each.value
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
}
