#!/bin/bash

function setup () {
	source $(dirname $BASH_SOURCE)/build.0.bash &
	source $(dirname $BASH_SOURCE)/publish.0.bash
	wait
}

setup $1
