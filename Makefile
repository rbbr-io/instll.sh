GITHUB_REPOSITORY := ghcr.io/rbbr-io/instll.sh
CONTAINER_NAME := instll-sh
IMAGE_TAG := latest

.PHONY: build build-caddy-local build-local build-nginx build-nginx-local run stop clean ship test test-nginx test-localhost

# Main production build (Caddy)
build:
	docker build --platform linux/amd64 -f Dockerfile -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Local Caddy build (native platform)
build-caddy-local:
	docker build -f Dockerfile -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Local development build (simple nginx redirects)
build-local:
	docker build -f Dockerfile.localhost -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Legacy nginx build for production (with mirror + GoatCounter)
build-nginx:
	docker build --platform linux/amd64 -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Legacy nginx build for local testing
build-nginx-local:
	docker build -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

run:
	docker run -d --name $(CONTAINER_NAME) -p 80:80 $(GITHUB_REPOSITORY):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(GITHUB_REPOSITORY):$(IMAGE_TAG) || true

docker-login:
	docker login ghcr.io

ship: build
	docker push $(GITHUB_REPOSITORY):$(IMAGE_TAG)

deploy:
	curl -X POST http://138.199.233.98:3000/api/deploy/d8c6b2ac68bf2eba9ae9453a7851de35d86890655ba3c235
