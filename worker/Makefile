CONTAINER_REPO ?= ghcr.io/alban/asg2024/worker
IMAGE_TAG ?= latest

docker/build:
	docker build --tag $(CONTAINER_REPO):$(IMAGE_TAG) .

docker/push:
	docker push $(CONTAINER_REPO):$(IMAGE_TAG)

docker/run:
	docker run -ti --rm -e TICKER=5s --name worker $(CONTAINER_REPO):$(IMAGE_TAG)
