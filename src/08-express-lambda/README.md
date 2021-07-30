# Overview

1. From the root directory of the project, run `DIR=./src/08-express-lambda docker-compose run terraform init`
1. From the root directory of the project, run `DIR=./src/08-express-lambda docker-compose run terraform apply -auto-approve`
1. Make `POST` request to `https://lambda.us-east-1.amazonaws.com/2015-03-31/functions/08-express-lambda/invocations` using [AWS4 Signature](https://stackoverflow.com/a/40752754)
