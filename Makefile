GITHUB_REPOSITORY := ghcr.io/rbbr-io/instll.sh
CONTAINER_NAME := instll-sh
IMAGE_TAG := latest

# Main production build (Caddy AMD64)
build:
	docker build --platform linux/amd64 -f Dockerfile -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Local build (native platform)
build-local:
	docker build -f Dockerfile -t $(GITHUB_REPOSITORY):$(IMAGE_TAG) .

# Single container run
run:
	docker run -d --name $(CONTAINER_NAME) -p 80:80 $(GITHUB_REPOSITORY):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(GITHUB_REPOSITORY):$(IMAGE_TAG) || true

ship: build
	docker push $(GITHUB_REPOSITORY):$(IMAGE_TAG)

deploy:
	curl -X POST http://138.199.233.98:3000/api/deploy/d8c6b2ac68bf2eba9ae9453a7851de35d86890655ba3c235

all: ship deploy dog-push	curl

dog:
	sitedog render

dog-push:
	sitedog push

curl:
	curl -fsSL instll.sh/rbbr-io/instll.sh | sh

push:
	git push

commit:
	git add .
	git commit -m "..."

commit!: commit push

open:
	open https://instll.sh/rbbr-io/instll.sh