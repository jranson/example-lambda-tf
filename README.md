# AWS Lambda Example w/ Golang + Terraform

This project demonstrates a "Hello World!" AWS Lambda Function (golang) that can be built and deployed with Terraform via Makefile commands.

## Pre-requisites

* Golang 1.19
* Terraform 1.x
* Developer tools for your OS that provide the `make` command

## Getting Started

Add a `./terraform/terraform.tfvars` file with a valid `aws_profile` value.

```bash
$ make install
```

Now you can deploy to AWS with 

```bash
$ make build deploy
```

Now you can go to the Lambda section of the AWS Console and test the function (or invoke it with the AWS CLI, etc.). If you want to add some triggers like SNS, that's pretty easy to do by referring to the [Terraform Documentation](registry.terraform.io/providers/hashicorp/aws/latest/docs/resources).

You can remove the deployment with

```bash
$ make destroy clean
```

See the [Makefile](./Makefile) for a complete list of targets.
