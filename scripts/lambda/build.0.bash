#!/bin/bash

function build() {
	local DIR=$1

	local FILE=$(pwd)/$DIR/docker-compose.yml
	echo $FILE
	docker-compose -f $FILE build
}

build $1
