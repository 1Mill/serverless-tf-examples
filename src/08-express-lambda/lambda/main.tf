terraform {
	required_providers {
		local = {
			source = "hashicorp/local"
			version = "~> 2.1"
		}
	}
}

data "local_file" "config" { filename = "${path.module}/config.bash" }
locals {
	config = merge([for col in [for s in split("\n", data.local_file.config.content) : split("=", s)] : length(col) >= 2 ? { (col[0]) = col[1] } : {}]...)
}

module "docker_image" {
	source = "terraform-aws-modules/lambda/aws//modules/docker-build"

	create_ecr_repo = true
	ecr_repo = local.config.FUNCTION_NAME
	image_tag = "0.0.1"
	source_path = abspath(path.module)
}
module "aws_lambda" {
	source = "terraform-aws-modules/lambda/aws"
	version = "~> 2.7"

	environment_variables = {
		"NODE_ENV" = "production"
		"SOME_ENV_VAR" = "my-prod-var"
	}
	create_package = false
	function_name = local.config.FUNCTION_NAME
	image_uri = module.docker_image.image_uri
	package_type = "Image"
	timeout = local.config.TIMEOUT
}
