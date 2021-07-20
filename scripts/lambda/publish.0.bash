#!/bin/bash

source $(dirname $BASH_SOURCE)/constants.0.bash

function publish () {
	local CONFIG_PATH=$(pwd)/$1/lambda.config

	source $CONFIG_PATH

	local FUNCTION_NAME=$FUNCTION_NAME
	local IMAGE=$IMAGE
	local TIMEOUT=${TIMEOUT-3}

	aws lambda delete-function \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--region $LOCALSTACK_REGION

	aws lambda create-function \
		--code ImageUri=$IMAGE \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--package-type Image \
		--region $LOCALSTACK_REGION \
		--role arn:aws:iam::000000000:role/lambda-ex \
		--timeout $TIMEOUT
}

publish $1
