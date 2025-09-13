.PHONY: kind-create build-image push-image load-image apply-dev

kind-create:
	kind create cluster --name wedo

build-image:
	docker build -t wedo-dev:local ./app

load-image:
	# if using kind: load local image into kind
	kind load docker-image wedo-dev:local --name wedo

apply-dev:
	kubectl apply -f deployments/dev
