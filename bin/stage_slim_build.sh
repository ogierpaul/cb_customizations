#!/bin/bash

git checkout stage
git pull origin stage

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"/dbt || exit

dbt build --select state:modified+ --target stage --state=../../jfrog/stage  || exit

dbt compile --target stage --target-path=../../jfrog/stage 

dbt clean

cd ..

git add .
git commit -m "Message"

git push origin stage


