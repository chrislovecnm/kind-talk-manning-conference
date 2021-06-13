#!/bin/bash

HOST=$(ctlptl get cluster kind-kind -o template --template '{{.status.localRegistryHosting.host}}')
cat deployment.yaml | sed "s/REGISTRY_HOST_PLACEHOLDER/$HOST/" | kubectl apply -f -
