FUNCTION_NAME=06-localstack-docker-lambda
TIMEOUT=60

ENVIRONMENT="{
	SOME_ENV_VAR=$SOME_ENV_VAR,
	someting=$FUNCTION_NAME,
	testing=true,
}"
