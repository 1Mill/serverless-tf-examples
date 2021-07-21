# serverless-tf-examples

## 06 Example

```bash
docker-compose up --build localstack
```

```bash
./scripts/lambda/run.0.bash ./src/06-localstack-docker-lambda 0 setup
```

```bash
./scripts/lambda/run.0.bash ./src/06-localstack-docker-lambda 0 invoke '{ "some-data": "this is some string", "another value": true}'
```

If something is returned from the Lambda after `invoke`, check `output.json`.
