#!/bin/bash

function invoke() {
	source $(dirname $BASH_SOURCE)/constants.0.bash

	local CONFIG_FILE_PATH=$(pwd)/$1/$CONFIG_FILENAME
	source $CONFIG_FILE_PATH

	local FUNCTION_NAME=$FUNCTION_NAME

	aws lambda invoke \
		--cli-binary-format raw-in-base64-out \
		--endpoint $LOCALSTACK_URL \
		--function-name $FUNCTION_NAME \
		--invocation-type RequestResponse \
		--payload "${2-'{}'}" \
		--region $LOCALSTACK_REGION \
		output.json
}

invoke $1 "$2"
