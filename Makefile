SHELL := /bin/bash

TAG=${whoami}-apt-repo

all:
	echo >&2 "Must specify target."

whoami    := $(shell whoami)

docker_build:
	docker build -t $(TAG) .

docker_run:
	docker run -it --rm -h docker-$(TAG) -p 80 --entrypoint /bin/bash --name $(TAG) $(TAG)

docker_exec:
	docker exec -it $(TAG) /bin/bash

docker_stop:
	docker stop $(TAG) && docker rm -f $(TAG)

.PHONY: all docker_build docker_run docker_exec docker_stop
