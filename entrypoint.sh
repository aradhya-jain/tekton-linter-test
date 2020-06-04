#!/bin/bash

while getopts l:f: flag; do
    case "${flag}" in
    l) linter=${OPTARG} ;;
    f) files=${OPTARG} ;;
    esac
done

if [ "$linter" == "yaml" ]; then
    yamllint "$files" #performs lint on yaml files
elif [ "$linter" == "md" ]; then
    markdownlint "$files" # performs lint on markdown files
elif [ "$linter" == "shell" ]; then
    shellcheck "$files" # performs lint check on shell scripts
elif [ "$linter" == "prettier" ]; then
    npx prettier --check "$files" # opinionated code formatter checker
elif [ "$linter" == "tslint" ]; then
    tslint --project "$files" # typescript linter
elif [ "$linter" == "kubeval" ]; then
    kubeval "$files" # k8s files linter
fi
