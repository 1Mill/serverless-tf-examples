#!/bin/bash

aws lambda invoke \
	--cli-binary-format raw-in-base64-out \
	--endpoint http://localhost:4566 \
	--function-name testing-function-name \
	--invocation-type RequestResponse \
	--payload '{ "name": "Bob"}' \
	--region us-east-1 \
	output.json
