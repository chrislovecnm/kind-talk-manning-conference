SHELL:=/bin/bash
REGISTRY_HOST=localhost:5000

create-kind: create-registry
	kind create cluster --config kind/kind.yaml
	kubectl create -f kind/configmap.yaml

create-registry:
	kind/setup-local-registry.sh

delete-kind: delete-registry
	kind delete cluster

delete-registry:
	kind/stop-local-registry.sh

docker-push:
	docker build -t $(REGISTRY_HOST)/api . 
	docker push $(REGISTRY_HOST)/api

create-deployment:
	kubectl create -f yaml/deployment.yaml
