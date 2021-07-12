FROM hashicorp/terraform:1.0.2

RUN apk add \
	docker \
	npm \
	python3
