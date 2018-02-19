.PHONY: build

NAMESPACE ?= bentruyman
IMAGE_NAME ?= mame-builder
VERSION ?= latest
MAME_VERSION ?= mame0194

build: Dockerfile
	docker build -t $(NAMESPACE)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

compile:
	docker run --rm -it \
		-e MAME_VERSION=$(MAME_VERSION) \
		-v $(PWD)/build:/workspace \
		$(NAMESPACE)/$(IMAGE_NAME):$(VERSION)
