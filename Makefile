create-kind: create-registry
	ctlptl apply -f ctlptl/registry.yaml

create-registry:
	ctlptl apply -f ctlptl/cluster.yaml

delete-kind:
	ctlptl delete -f ctlptl/cluster.yaml

delete-registry:
	ctlptl delete -f ctlptl/registry.yaml

docker-push:
	docker build -t localhost:5005/api . 
	docker push localhost:5005/api
