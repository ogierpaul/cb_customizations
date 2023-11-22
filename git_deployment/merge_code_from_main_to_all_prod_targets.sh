#!/bin/bash
repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root" || exit

git checkout main
git pull origin/main
bash git_deployment/merge_code_from_ref_to_target.sh --reference main --target standard
bash git_deployment/merge_code_from_ref_to_target.sh --reference main --target client1
bash git_deployment/merge_code_from_ref_to_target.sh --reference main --target client2
git checkout main