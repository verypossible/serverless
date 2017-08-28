NAME = verypossible/serverless
VERSION = 1.19.0

.PHONY:	all py2 py3 shell


all : py2 py3

py2 :
	docker build \
		-t $(NAME):$(VERSION) \
		--build-arg SERVERLESS_VERSION=$(VERSION) \
		.

py3 :
	docker build \
		-t $(NAME):$(VERSION)-python3 \
		-f Dockerfile-python3 \
		--build-arg SERVERLESS_VERSION=$(VERSION) \
		.

shell :
	docker run --rm -it $(NAME):$(VERSION) bash
