# Linter

The following task is used to provide linter support for various languages:-

- `prettier` (An opinionated code format checker)
- `tslint` (TypeScript lint)
- `yamllint` (YAML linter)
- `mdlint` (Markdown linter)
- `shellcheck` (Bash linter)
- `kubeval` (Performs linter on Kubernetes manifests using `kubeval`) _Note_: Kubeval is used to validate one or more Kubernetes configuration files, and is often used locally as part of a development workflow as well as in CI pipelines.

## Installing the Task

```bash
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/linter/linter.yaml
```

## Parameters

- **linter** : The linter which you want to apply on the cloned repository. Appected values are `prettier`, `tslint`, `yaml`, `md`, `shell`, `kubeval`
- **filepath** : The file path containing the files on which you want to apply the linter check

## Workspaces

- **file-workspace** : The workspace containing files on which we want to apply linter check. It can be a shared workspace with the `git-clone` task or a `ConfigMap` mounted containing some files

## Usage
