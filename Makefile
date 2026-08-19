DOCKER ?= docker
IMAGE ?= octuna
TAG ?= latest

.PHONY: build run

build:
	$(DOCKER) build -f Dockerfile.arm -t $(IMAGE):$(TAG) .

run: build
	@test -f config.json || (printf 'Missing config.json. Run: cp config.example.json config.json && npm run setup\n' >&2; exit 1)
	@printf 'Octuna is available at http://localhost:3030\n'
	$(DOCKER) run --rm -p 3030:3030 \
		-v "$(CURDIR)/config.json:/app/config.json:ro" \
		-v "$(CURDIR)/data:/app/data" \
		$(IMAGE):$(TAG)
