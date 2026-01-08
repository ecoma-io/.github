#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "${CURRENT_DIR}/cmd-exits.sh" \
    yq jq unzip zip git ping zsh \
    go node npm yarn pnpm dprint docker \
    shellcheck lefthook conform shfmt pants \
    kubectl helm k3d minikube kustomize kubeseal \
    terraform ansible ansible-lint \
    actionlint golangci-lint

bash "${CURRENT_DIR}/cache.sh"