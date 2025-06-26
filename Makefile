CONTAINER_NAME := ghcr.io/inem/instll.sh
IMAGE_TAG := latest

.PHONY: build run stop clean ship

build:
	docker build -t $(CONTAINER_NAME):$(IMAGE_TAG) .

run:
	docker run -d --name $(CONTAINER_NAME) -p 80:80 $(CONTAINER_NAME):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(CONTAINER_NAME):$(IMAGE_TAG) || true

# ship:
# 	docker push $(CONTAINER_NAME):$(IMAGE_TAG)

docker-login:
	docker login ghcr.io


ship:
	docker push ghcr.io/$(GITHUB_REPOSITORY):latest