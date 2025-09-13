#!/usr/bin/env bash
set -e
kubectl create namespace argocd || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Port-forwarding argocd-server for access (web UI at http://localhost:8080)"
kubectl -n argocd port-forward svc/argocd-server 8080:443
