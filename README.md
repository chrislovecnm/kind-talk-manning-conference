# Kind Talk

## Required Tools

1. kubectl and kind: https://kubernetes.io/docs/tasks/tools/
2. container runtime such as docker: https://docs.docker.com/get-docker/

## kind

kind is a tool that runs a local Kubernetes cluster using an image that
contains a full Kubernetes cluster. The tool kind is maintained by the K8s
test team and is used for Kubernetes testing.

## Tested Environments

This demo was built on WSL2, so should run under most Linux environments.

## Demo

The Makefile in this project contains all of these commands. After installing
all of the above tools you can run the make targets.
