terraform {
	required_version = "~> 1.0"

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

module "aws_lambda" {
	source = "terraform-aws-modules/lambda/aws"
	version = "~> 2.0"

	function_name = "hello-world"
	handler = "index.handler"
	runtime = "nodejs14.x"
	source_path = [
		"${path.module}/index.js"
	]
}
