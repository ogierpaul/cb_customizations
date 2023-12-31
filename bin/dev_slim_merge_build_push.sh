#!/bin/bash

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"/dbt || exit

git merge origin/dev -m "Update from origin"
dbt build --select state:modified+ --target dev --state=../../jfrog/dev || exit
dbt compile --target dev --target-path=../../jfrog/dev 
dbt clean

cd "$repo_root"
git add .
git commit -m "Updated artifacts"
git push origin dev


