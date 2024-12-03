# terraform-aws-vpc
Generic VPC deployment for a spoke account.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tgw"></a> [tgw](#module\_tgw) | ./modules/tgw | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |
| <a name="module_vpx"></a> [vpx](#module\_vpx) | ./modules/vpx | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_tags"></a> [aws\_tags](#input\_aws\_tags) | Additional AWS tags to apply to resources in this module. | `map(string)` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | The unique identifier for this deployment. | `string` | n/a | yes |
| <a name="input_tgw"></a> [tgw](#input\_tgw) | The ID of the external transit gateway to associate with a VPC. | `string` | `null` | no |
| <a name="input_tgw_route"></a> [tgw\_route](#input\_tgw\_route) | The route (CIDR) to associate with the transite gateway. | `string` | `null` | no |
| <a name="input_vpc_flow_logs_bucket"></a> [vpc\_flow\_logs\_bucket](#input\_vpc\_flow\_logs\_bucket) | The name of an existing S3 bucket to use for VPC flow logs. | `string` | n/a | yes |
| <a name="input_vpc_nat"></a> [vpc\_nat](#input\_vpc\_nat) | Whether to create a NAT gateway. | `bool` | `false` | no |
| <a name="input_vpc_nat_multi_az"></a> [vpc\_nat\_multi\_az](#input\_vpc\_nat\_multi\_az) | Whether to create only a single NAT gateway for all private subnets to use, or to create a NAT gateway in each AZ. | `bool` | `false` | no |
| <a name="input_vpc_network_address"></a> [vpc\_network\_address](#input\_vpc\_network\_address) | The private IP network address to use for the VPC CIDR block. | `string` | `"10.0.0.0"` | no |
| <a name="input_vpc_network_mask"></a> [vpc\_network\_mask](#input\_vpc\_network\_mask) | The network mask to use for the VPC CIDR block. Must be between 16 and 28. | `number` | `16` | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | The IDs of the external VPC to peer with. | `list(string)` | `[]` | no |
| <a name="input_vpc_subnet_new_bits"></a> [vpc\_subnet\_new\_bits](#input\_vpc\_subnet\_new\_bits) | The adjustment to make to the VPC network mask (in bits) to define the subnets. | `number` | `6` | no |
| <a name="input_vpc_subnets"></a> [vpc\_subnets](#input\_vpc\_subnets) | The number of public-private subnet pairs to create. Cannot be greater than the number of AZ in this region. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tgw"></a> [tgw](#output\_tgw) | The transit gateway associated with the VPC. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPC. |
| <a name="output_vpc_private_subnets"></a> [vpc\_private\_subnets](#output\_vpc\_private\_subnets) | The private subnets. |
| <a name="output_vpc_public_subnets"></a> [vpc\_public\_subnets](#output\_vpc\_public\_subnets) | The public subnets. |
| <a name="output_vpx"></a> [vpx](#output\_vpx) | The VPC peering connections. |
<!-- END_TF_DOCS -->