#!/bin/bash

source $(dirname $BASH_SOURCE)/constants.0.bash

function publish () {
	local FUNCTION_NAME=testing-function-name
	local IMAGE=dev/06-localstack-docker-lambda
	local TIMEOUT=3

	aws lambda delete-function \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--region us-east-1

	aws lambda create-function \
		--code ImageUri=$IMAGE \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--package-type Image \
		--region us-east-1 \
		--role arn:aws:iam::000000000:role/lambda-ex \
		--timeout $TIMEOUT
}

publish
