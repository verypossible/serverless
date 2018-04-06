NAME = verypossible/serverless
VERSION = 1.26.1
SERVERLESS_VERSION = $(VERSION)
YARN_VERSION = 1.5.1

.PHONY:	all py2 py3 shell


all : py2 py3

py2 :
	docker build \
		-t $(NAME):$(VERSION) \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py3 :
	docker build \
		-t $(NAME):$(VERSION)-python3 \
		-f Dockerfile-python3 \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py2-shell :
	docker run --rm -it $(NAME):$(VERSION) bash

py3-shell :
	docker run --rm -it $(NAME):$(VERSION)-python3 bash
