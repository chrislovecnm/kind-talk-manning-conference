SHELL:=/bin/bash
REGISTRY_HOST=localhost:5000

# create a kind cluster with a local registry
create-kind: create-registry
	kind create cluster --config kind/kind.yaml
	kubectl create -f kind/configmap.yaml

# setup a local registry running in a container engine
create-registry:
	kind/setup-local-registry.sh

# remove a kind cluster and the registry
delete-kind: delete-registry
	kind delete cluster

delete-registry:
	kind/stop-local-registry.sh

# build our example application
docker-push:
	docker build -t $(REGISTRY_HOST)/api . 
	docker push $(REGISTRY_HOST)/api

# deploy our example application to kubernetes
create-deployment:
	kubectl create -f yaml/deployment.yaml

# deploy nginx and use the nodeport service
nginx-deploy:
	kubectl create deployment nginx --image=nginx --port=80
	kubectl create service nodeport nginx --tcp=80:80 --node-port=30000
