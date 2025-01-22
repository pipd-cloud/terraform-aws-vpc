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
  count                     = length(data.aws_route_tables.vpc.ids)
  route_table_id            = data.aws_route_tables.vpc.ids[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpx.cidr_block
}

resource "aws_route" "vpx" {
  count                     = length(data.aws_route_tables.vpx.ids)
  route_table_id            = data.aws_route_tables.vpx.ids[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
}
