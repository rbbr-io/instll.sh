GIT_REPO := $(shell git remote get-url origin | sed -E 's/.*[\/:]([^\/]+\/[^\/]+)\.git$$/\1/' | sed 's/\.git$$//')
GIT_URL := $(shell git remote get-url origin)
REGISTRY := $(shell \
	if echo "$(GIT_URL)" | grep -q "github.com"; then \
		echo "ghcr.io/$(GIT_REPO)"; \
	elif echo "$(GIT_URL)" | grep -q "gitlab.com"; then \
		echo "registry.gitlab.com/$(GIT_REPO)"; \
	else \
		echo "registry.example.com/$(GIT_REPO)"; \
	fi)

CONTAINER_NAME := instll-sh
IMAGE_TAG := latest

# Main production build (Caddy AMD64)
build:
	docker build --platform linux/amd64 -f Dockerfile -t $(REGISTRY):$(IMAGE_TAG) .

# Local build (native platform)
build-local:
	docker build -f Dockerfile -t $(REGISTRY):$(IMAGE_TAG) .

# Single container run
run:
	docker run -d --name $(CONTAINER_NAME) -p 80:80 $(REGISTRY):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(REGISTRY):$(IMAGE_TAG) || true

ship: build
	docker push $(REGISTRY):$(IMAGE_TAG)

deploy:
	curl -X POST http://138.199.233.98:3000/api/deploy/d8c6b2ac68bf2eba9ae9453a7851de35d86890655ba3c235

all: ship deploy curl

curl:
	curl -fsSL instll.sh/rbbr-io/instll.sh | sh

push:
	git push

commit:
	git add .
	git commit -m "..."

commit!: commit push

open:
	open https://github.com/rbbr-io/instll.sh