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
  depends_on                = [data.aws_route_tables.vpc]
  for_each                  = toset(data.aws_route_tables.vpc.ids)
  route_table_id            = each.value
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpx.cidr_block
}

resource "aws_route" "vpx" {
  depends_on                = [data.aws_route_tables.vpx]
  for_each                  = toset(data.aws_route_tables.vpx.ids)
  route_table_id            = each.value
  vpc_peering_connection_id = aws_vpc_peering_connection.vpx.id
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
}
