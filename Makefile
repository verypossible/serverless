NAME = verypossible/serverless
SERVERLESS_VERSION = 1.60.4
YARN_VERSION = 1.12.3

.PHONY:	all py3 shell


all : py3

py3 :
	docker build \
		-t $(NAME):$(SERVERLESS_VERSION) \
		-f Dockerfile \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py3-shell :
	docker run --rm -it $(NAME):$(SERVERLESS_VERSION) bash
