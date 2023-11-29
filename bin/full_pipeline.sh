#!/bin/bash

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root" || exit

git checkout dev
bash bin/dev_slim_merge_build_push.sh

git checkout stage
git pull origin stage
git merge origin/dev -m "Merging dev"
bash bin/stage_slim_build.sh

git checkout main
git pull origin main
git merge origin/stage -m "Merging stage"
cd dbt
dbt build --select state:modified+ --target main --state=../../jfrog/main  || exit
dbt compile --target main --target-path=../../jfrog/main
dbt clean
cd ..
git add .
git commit -m "M"
git push origin main

bash bin/update_prod_with_main

