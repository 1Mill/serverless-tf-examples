# serverless-tf-examples

## 06 Example

```bash
./scripts/lambda/setup.0.bash ./src/06-localstack-docker-lambda
```

```bash
./scripts/lambda/invoke.0.bash ./src/06-localstack-docker-lambda '
{"some-data": true}'
```

If something is returned from the Lambda after `invoke`, check `output.json`.
