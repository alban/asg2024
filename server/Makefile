CONTAINER_REPO ?= ghcr.io/alban/asg2024/server
IMAGE_TAG ?= latest

generate-key-pair:
	openssl req  -nodes -new -x509  \
		-keyout ./server.key \
		-out ./server.cert \
		-subj "/C=DE/ST=Berlin/L=Berlin/O=IG@ASG/OU=ASG/CN=nomnom.company.com"

docker/build:
	docker build --tag $(CONTAINER_REPO):$(IMAGE_TAG) .

docker/push:
	docker push $(CONTAINER_REPO):$(IMAGE_TAG)

docker/run:
	docker run -ti --rm --name server $(CONTAINER_REPO):$(IMAGE_TAG)
