

## What this repo contains
- `app/` - tiny Node.js app + Dockerfile
- `deployments/` - declarative Kubernetes manifests for dev/prod
- GitHub Actions workflow builds image, pushes to registry, updates manifests (GitOps)
- `deployments/argocd/app-dev.yaml` - ArgoCD Application manifest (edit repoURL)

## Quick steps (what I did)
1. Create GitHub repo and push this code.
2. Add GitHub secrets:
   - `DOCKERHUB_USERNAME`
   - `DOCKERHUB_PASSWORD`
3. Create a Kubernetes cluster (kind/minikube) and install ArgoCD.
4. In ArgoCD, create an Application pointing at `deployments/dev` or apply `deployments/argocd/app-dev.yaml`.
5. Push to `main` — GitHub Action builds image, updates `deployments/dev/deployment.yaml`, ArgoCD auto-syncs.

## How to run locally (without ArgoCD)
- `make kind-create`
- `make build-image`
- `make load-image`
- `kubectl apply -f deployments/dev`

## Submission
- Repo: (link)
- README (this file) explains how to run
- CI is configured to follow GitOps: images are built and the declarative manifests in Git are updated by CI; an operator (ArgoCD) synchronizes the cluster from those manifests.
