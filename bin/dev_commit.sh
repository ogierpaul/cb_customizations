#!/bin/bash

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"/dbt || exit

dbt clean
dbt compile --target dev --target-path artifacts/local

cd ..

git add .
git commit -m "M"
