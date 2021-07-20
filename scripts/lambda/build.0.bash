#!/bin/bash

function build() {
	source $(dirname $BASH_SOURCE)/constants.0.bash

	local CONFIG_FILE_PATH=$(pwd)/$1/$CONFIG_FILENAME
	source $CONFIG_FILE_PATH

	local FILE=$(dirname $BASH_SOURCE)/docker-compose.yml
	local FUNCTION_NAME=$FUNCTION_NAME

	DIR=$(pwd)/$1 \
	FUNCTION_NAME=$FUNCTION_NAME \
	docker-compose -f $FILE build
}

build $1
