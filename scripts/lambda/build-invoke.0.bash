#!/bin/bash

function build_invoke () {
	source $(dirname $BASH_SOURCE)/build.0.bash
	source $(dirname $BASH_SOURCE)/invoke.0.bash
}

build_invoke $1
