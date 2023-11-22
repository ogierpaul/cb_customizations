#!/bin/bash
# Default values
target="dev"

# Parse named arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -t|--target)
            target="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done

git checkout $target
git pull origin $target
cd cb_customizations
dbt run --target $target