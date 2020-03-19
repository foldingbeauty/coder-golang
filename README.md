# Welcome to CoderGolang

CoderGolang is VS Code preloaded with Go (1.14) and some VS Code extensions.

- Golang 1.14
- [Code Server 3.0](https://github.com/cdr/code-server)
- VS Code Extensions (Yaml, K8S Snippets, Golang)
- [Redhat UBI 8.1 base image](https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/ubi8/ubi)

## Get started

`$ podman run -it --rm -p 8080:8080 -v ${PWD}:/home/coder/workspace foldingbeauty/coder:latest`

or

`$ docker run -it --rm -p 8080:8080 -v ${PWD}:/home/coder/workspace foldingbeauty/coder:latest`


Point your browser @ http://localhost:8080 and start Go-ing!

## Container image repository

https://hub.docker.com/r/foldingbeauty/coder

## Status

Work in progress
