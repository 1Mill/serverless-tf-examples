#!/bin/bash

aws lambda delete-function \
	--endpoint http://localhost:4566/ \
	--function-name testing-function-name \
	--region us-east-1

aws lambda create-function \
	--code ImageUri=localhost:4566/docker.io/library/05-testing-v2 \
	--endpoint http://localhost:4566 \
	--function-name testing-function-name \
	--memory-size 512 \
	--package-type Image \
	--region us-east-1 \
	--role arn:aws:iam::000000000:role/lambda-ex \
	--timeout 60
