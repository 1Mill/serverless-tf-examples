#!/bin/bash

function publish () {
	source $(dirname $BASH_SOURCE)/constants.0.bash

	# ! Must load .env before config.lambda so that secret
	# ! env vars are loaded into memory before they are used
	local ENV_FILE_PATH=$(pwd)/$1/$ENV_FILENAME
	if [ -f "$ENV_FILE_PATH" ]; then
		source $ENV_FILE_PATH
	fi

	local CONFIG_FILE_PATH=$(pwd)/$1/$CONFIG_FILENAME
	source $CONFIG_FILE_PATH

	local DEV_ENVIRONMENT=${DEV_ENVIRONMENT-"{}"}
	local FUNCTION_NAME=$FUNCTION_NAME
	local TIMEOUT=${TIMEOUT-3}

	aws lambda delete-function \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--region $LOCALSTACK_REGION

	aws lambda create-function \
		--code ImageUri=$FUNCTION_NAME \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--package-type Image \
		--region $LOCALSTACK_REGION \
		--role arn:aws:iam::000000000:role/lambda-ex \
		--timeout $TIMEOUT

	aws lambda update-function-configuration \
		--endpoint $LOCALSTACK_URL \
		--environment "Variables=$DEV_ENVIRONMENT" \
		--function-name $FUNCTION_NAME \
		--region $LOCALSTACK_REGION
}

publish $1
