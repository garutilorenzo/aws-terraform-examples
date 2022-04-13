# Bastion host

This module creates a bastion host to reach all the private resources deployed in the private subnets.

The install template will:

* add a bastion group
* add a bastion user
* limit the bastion user to use the bastion host only for "ssh jump"
* allow a list of ssh keys to use this instance as bastion host

**NOTE** the ubuntu user is still accessible using the ssh key specified in the variable *ssk_key_pair_name*

## Requirements

One VPC with at least one subnet, one ssh key already uploaded on AWS

## Module variables

| Var   | Required | Desc |
| ------- | ------- | ----------- |
| `ssk_key_pair_name` | `yes`  | The ssh key pari name uploaded to AWS |
| `subnet_id`  | `yes`  | The subnet id where the instance will be deployed |
| `security_group_ids`  | `yes`  | A list of security group ids |
| `environment`  | `no`  | Current work environment (Example: staging/dev/prod). Default: staging |
| `instance_type`  | `no`  | Instance type to use. Default: t2.micro |
| `ami`  | `no`  | Ami to use. Default: ami-081ff4b9aa4e81a08, ubuntu 20.04 |
| `bastion_user`  | `no`  | Bastion username. Default: bastion |
| `bastion_group`  | `no`  | Bastion group. Default: bastion |
| `ssh_keys_path`  | `no`  | List of ssh keys allowed to connect to the nat instance as bastion user. Default: ["~/.ssh/id_rsa.pub"] |

## Output

* bastion_ip, bastio host public ip address


