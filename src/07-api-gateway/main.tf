terraform {
	required_version = "~> 1.0"

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.0"
		}
	}
}

variable "FUNCTION_NAME" { type = string }
variable "TIMEOUT" {
	default = 3
	type = number
}

provider "aws" { region = "us-east-1" }

module "docker_image" {
	source = "terraform-aws-modules/lambda/aws//modules/docker-build"

	create_ecr_repo = true
	ecr_repo = var.FUNCTION_NAME
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
	function_name = var.FUNCTION_NAME
	image_uri = module.docker_image.image_uri
	package_type = "Image"
	timeout = var.TIMEOUT
}

module "apigateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 1.1"

  integrations = {
	"$default" = {
		lambda_arn = module.aws_lambda.lambda_function_arn
	}
  }
}

output "apigatewayv2_api_api_endpoint" {
	value = module.apigateway.apigatewayv2_api_api_endpoint
}
