// ! WIP: not currently working

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
	version = "~> 2.5"

	environment_variables = {
		"NODE_ENV" = "production",
	}
	function_name = "on-demand-install-with-docker"
	handler = "index.handler"
	runtime = "nodejs14.x"
	source_path = [
		{
			commands = ["npm install", ":zip"]
			path = path.module,
			patterns = [
				"!.*", // * Exclude everything
				"index.js",
				"node_modules/.+", // * Add all non-empty directories and files in /node_modules/
				"package-lock.json",
				"package.json",
			]
		},
	]
}
