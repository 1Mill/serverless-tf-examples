# How to invoke locally

Official lambda Node docker image: <https://gallery.ecr.aws/lambda/nodejs>

```bash
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'
```
