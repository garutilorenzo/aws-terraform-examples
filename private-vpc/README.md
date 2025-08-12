# VPC with private and public subnet

This module will deploy a one VCN with one public subnet ad one private subnet on each AZ of the region you choose. Also this modules deploy a security list with the following rueles:

* egress, all traffic allowed
* ingress, traffica allowed on port 22 only from my_public_ip_cidr

## Requirements

No Requirement

## Module variables

| Var   | Required | Desc |
| ------- | ------- | ----------- |
| `region`       | `yes`       | set the correct region based on your needs  |
| `my_public_ip_cidrs` | `yes`        | A list of public ip CIDR allowed to reach the resources |
| `environment`  | `no`  | Current work environment (Example: staging/dev/prod). Default: staging |
| `vpc_cidr_block`  | `no`  | VPC CIDR. Default: 172.68.0.0/16 |
| `vpc_newbits`  | `no`  | newbits used to calculate the private and public subnet CIDRs using [cidrsubnet fn](https://developer.hashicorp.com/terraform/language/functions/cidrsubnet). Default: 8|
| `private_subnet_offset`  | `no`  | Offset used to calculate the private subnet CIDRs using cidrsubnet fn. Default: 3 |
| `domain_name`  | `no`  |  The suffix domain name to use by default when resolving non Fully Qualified Domain Names. Default: aws-cloud.compute.internal. *NOTE* this variable will be interpoladed with the region variable, the final result will be: ${var.region}-${var.domain_name}  |
| `dns_servers`  | `no`  | List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS. Default: AmazonProvidedDNS |

## Output

* vpc_id, the VPC id
* public_subnet_ids, the list of the public subnet ids
* private_subnet_ids, the list of the private subnet ids
* security_group_id, the security group id
