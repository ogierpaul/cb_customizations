#!/bin/bash

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"/dbt || exit
# This line builds only modified models and their dependents against the local state
dbt build --select state:modified+ --target dev --state=artifacts/local