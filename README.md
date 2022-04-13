[![GitHub issues](https://img.shields.io/github/issues/garutilorenzo/aws-terraform-examples)](https://github.com/garutilorenzo/aws-terraform-examples/issues)
![GitHub](https://img.shields.io/github/license/garutilorenzo/aws-terraform-examples)
[![GitHub forks](https://img.shields.io/github/forks/garutilorenzo/aws-terraform-examples)](https://github.com/garutilorenzo/aws-terraform-examples/network)
[![GitHub stars](https://img.shields.io/github/stars/garutilorenzo/aws-terraform-examples)](https://github.com/garutilorenzo/aws-terraform-examples/stargazers)

# AWS terraform examples

In this repositroy there are 3 terrafrom modules, in order of dependency:

* [private-vpc](private-vpc/) - Setup a VPC with private and public subnets
* [bastion-host](bastion-host/) - Setup a bastion host to reach private resources
* [ec2-instance](ec2-instance) - Deploy a simple ec2 instance

For more information on how to use this modules follow the examples in the *examples* directory. To use this repository, clone this repository and use the *example* directory as base dir.

## Requirements

* [Terraform](https://www.terraform.io/) - Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.
* [Amazon AWS Account](https://aws.amazon.com/it/console/) - Amazon AWS account with billing enabled
* [aws cli](https://aws.amazon.com/cli/) optional

## Before you start

Note that this tutorial uses AWS resources that are outside the AWS free tier, so be careful!

## AWS provider setup

Follow the prerequisites step on [this](https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started) link.
In your workspace folder or in the [examples](examples/) directory of this repo create a file named terraform.tfvars:

```
AWS_ACCESS_KEY = "xxxxxxxxxxxxxxxxx"
AWS_SECRET_KEY = "xxxxxxxxxxxxxxxxx"
```

### Project setup

Once you have cloned this repo, change directory to [examples](examples/) dir. Edit the example file (main.tf) and set the needed variables (*change-me* variables). Crate a *terraform.tfvars* file, for more detail see [AWS provider setup](#aws-provider-setup) and read all the modules requirements in each module directory.

Or if you prefer you can create a new empty directory in your workspace and start a new project from scratch. To setup the project follow the README.md in the [examples](examples/) directory.