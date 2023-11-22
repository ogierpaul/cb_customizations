#!/bin/bash
# Default values
reference="dev"
target="dev"

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root" || exit

# Parse named arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -r|--reference)
            reference="$2"
            shift 2
            ;;
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
git merge origin/$target
git merge origin/$reference
git push origin $target
git checkout $reference
