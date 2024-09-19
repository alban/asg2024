TAG := $(shell git describe --tags --always --dirty)
GADGET ?= ghcr.io/alban/asg2024/gotls
#GADGET_TAG ?= $(TAG)
GADGET_TAG ?= latest
CLANG_FORMAT ?= clang-format
IG ?= ig
COSIGN ?= cosign
COSIGN_PRIVATE_KEY ?= cosign.key

.PHONY: build
build:
	sudo -E $(IG) image build \
		-t $(GADGET):$(GADGET_TAG) \
		--update-metadata .

# PARAMS can be used to pass additional parameters locally. For example:
# PARAMS="-o jsonpretty" make run
.PHONY: run
run:
	sudo -E $(IG) run $(GADGET):$(GADGET_TAG) $$PARAMS

.PHONY: push
push:
	sudo -E $(IG) image push $(GADGET):$(GADGET_TAG)

.PHONY: sign
sign:
	digest=$$(sudo -E $(IG) image inspect $(GADGET):$(GADGET_TAG) -o json | jq -r .Digest) ; \
	$(COSIGN) sign --key $(COSIGN_PRIVATE_KEY) --yes --recursive $(GADGET)@$$digest || exit 1


.PHONY: clang-format
clang-format:
	$(CLANG_FORMAT) -i program.bpf.c
