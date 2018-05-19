NAME = verypossible/serverless
VERSION = 1.27.2
SERVERLESS_VERSION = $(VERSION)
YARN_VERSION = 1.6.0

.PHONY:	all py2 py3 shell


all : py2 py3

py2 :
	docker build \
		-t $(NAME):$(VERSION)-python2 \
		-f Dockerfile-python2 \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py3 :
	docker build \
		-t $(NAME):$(VERSION) \
		-f Dockerfile \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py2-shell :
	docker run --rm -it $(NAME):$(VERSION)-python2 bash

py3-shell :
	docker run --rm -it $(NAME):$(VERSION) bash
