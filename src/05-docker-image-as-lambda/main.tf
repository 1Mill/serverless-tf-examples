terraform {
	required_version = "~> 1.0"

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.0"
		}
		local = {
			source = "hashicorp/local"
			version = "~> 2.1"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

locals {
	name = "05-docker-image-as-lambda"
}
module "docker_image" {
	source = "terraform-aws-modules/lambda/aws//modules/docker-build"

	create_ecr_repo = true
	ecr_repo = local.name
	image_tag = "1.0.0"
	source_path = abspath(path.module)
}
module "aws_lambda" {
	source = "terraform-aws-modules/lambda/aws"
	version = "~> 2.7"

	environment_variables = {
		"NODE_ENV" = "production",
	}
	create_package = false
	function_name = local.name
	image_uri = module.docker_image.image_uri
	package_type = "Image"
}
