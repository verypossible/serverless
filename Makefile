NAME = verypossible/serverless
VERSION = 1.25.0
SERVERLESS_VERSION = $(VERSION)
YARN_VERSION = 1.3.2

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

shell :
	docker run --rm -it $(NAME):$(VERSION) bash
