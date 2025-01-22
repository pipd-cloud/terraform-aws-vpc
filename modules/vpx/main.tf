resource "aws_vpc_peering_connection" "vpx" {
  vpc_id      = data.aws_vpc.vpc.id
  peer_vpc_id = data.aws_vpc.vpx.id
  auto_accept = true
  tags = merge(
    {
      Name = "${var.id}-vpc-vpx-${data.aws_vpc.vpx.id}"
      TFID = var.id
  }, var.aws_tags)
}

resource "aws_route" "vpc" {
  for_each                  = data.aws_route_tables.vpc
  route_table_id            = each.value.id
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpx.cidr_block
}

resource "aws_route" "vpx" {
  for_each                  = data.aws_route_tables.vpx
  route_table_id            = each.value.id
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
}
