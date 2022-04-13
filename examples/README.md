# Examples

Adjus all the *change-me* variables inside the main.tf file. Once you have setup your environment, we are ready to init terraform:

```
terraform init

Initializing modules...
- bastion-host in ../bastion-host
- ec2-instance in ../ec2-instance
- private-vpc in ../private-vpc

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/template...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/template v2.2.0...
- Installed hashicorp/template v2.2.0 (signed by HashiCorp)
- Installing hashicorp/aws v4.9.0...
- Installed hashicorp/aws v4.9.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Deploy

We are now ready to deploy our infrastructure. First we ask terraform to plan the execution with:

```
terraform plan

...
...
...

  # module.private-vpc.aws_vpc_dhcp_options_association.dns_resolver will be created
  + resource "aws_vpc_dhcp_options_association" "dns_resolver" {
      + dhcp_options_id = (known after apply)
      + id              = (known after apply)
      + vpc_id          = (known after apply)
    }

Plan: 25 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bastion_host_ip     = [
      + (known after apply),
    ]
  + ec2_instance_ip     = [
      + (known after apply),
    ]
  + private_subnets_ids = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]
  + public_subnets_ids  = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]
  + security_group_id   = (known after apply)
  + vpc_id              = (known after apply)

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

now we can deploy our resources with:

```
terraform apply

...
...

  # module.private-vpc.aws_vpc_dhcp_options_association.dns_resolver will be created
  + resource "aws_vpc_dhcp_options_association" "dns_resolver" {
      + dhcp_options_id = (known after apply)
      + id              = (known after apply)
      + vpc_id          = (known after apply)
    }

Plan: 25 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bastion_host_ip     = [
      + (known after apply),
    ]
  + ec2_instance_ip     = [
      + (known after apply),
    ]
  + private_subnets_ids = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]
  + public_subnets_ids  = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]
  + security_group_id   = (known after apply)
  + vpc_id              = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

...
...

Apply complete! Resources: 25 added, 0 changed, 0 destroyed.

Outputs:

bastion_host_ip = [
  "54.x.x.x",
]
ec2_instance_ip = [
  "172.x.x.x",
]
private_subnets_ids = [
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-xxxxxxxxxxxxxxxxx",
]
public_subnets_ids = [
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-xxxxxxxxxxxxxxxxx",
]
security_group_id = "sg-xxxxxxxxxxxx"
vpc_id = "vpc-xxxxxxxxxxxx"
```

### Connect to private instances

```
ssh -J bastion@54.x.x.x ubuntu@172.x.x.x

Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-1028-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Apr 13 12:04:14 UTC 2022

  System load:  0.15              Processes:             103
  Usage of /:   18.3% of 7.69GB   Users logged in:       0
  Memory usage: 20%               IPv4 address for eth0: 172.68.3.212
  Swap usage:   0%

1 update can be applied immediately.
To see these additional updates run: apt list --upgradable


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@i-04635156ea398e57d:~$
```

### Start a project from scratch

If you want to create a new project from scratch you need three files:

* terraform.tfvars - More details in [AWS provider setup](../README.md#aws-provider-setup)
* main.tf - download the file from this directory
* provider.tf - download the file from this directory

### Cleanup

```
terraform destroy
```