GITHUB_REPOSITORY := ghcr.io/rbbr-io/instll.sh
CONTAINER_NAME := $(GITHUB_REPOSITORY)
IMAGE_TAG := latest

.PHONY: build run stop clean ship

build:
	docker build --platform linux/amd64 -t $(CONTAINER_NAME):$(IMAGE_TAG) .

run:
	docker run -d --name $(CONTAINER_NAME) -p 80:80 $(CONTAINER_NAME):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(CONTAINER_NAME):$(IMAGE_TAG) || true

docker-login:
	docker login ghcr.io

ship: build
	docker push $(GITHUB_REPOSITORY):$(IMAGE_TAG)

deploy:
	curl -X POST http://138.199.233.98:3000/api/deploy/d8c6b2ac68bf2eba9ae9453a7851de35d86890655ba3c235