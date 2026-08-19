DOCKER ?= docker
IMAGE ?= octuna
TAG ?= latest

.PHONY: build

build:
	$(DOCKER) build -f Dockerfile.arm -t $(IMAGE):$(TAG) .
