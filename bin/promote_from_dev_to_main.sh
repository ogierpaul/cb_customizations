#!/bin/bash


# Define branch names
dev_branch="dev"
stage_branch="stage"
main_branch="main"

# Get the root directory of the Git repository
repo_root=$(git rev-parse --show-toplevel)

# Change to the root directory
cd "$repo_root" || exit

# Ensure we are on the dev branch
git checkout "$dev_branch" || exit

# Pull the latest changes from the dev branch
git pull origin "$dev_branch" || exit


# Run tests or any other validation steps here
bash tests/test_dbt_build_full.sh --target "$dev_branch" || exit

git add .
git commit -m "message"

git push origin "$dev_branch" || exit

# If tests pass, move to the stage branch
git checkout "$stage_branch" || exit
git merge --no-ff "$dev_branch" -m "Merge $dev_branch into $stage_branch" || exit
bash tests/test_dbt_build_full.sh --target "$stage_branch" || exit
git push origin "$stage_branch" || exit

# If deploying to a stage environment, add deployment steps here

# If everything is successful, move to the main branch
git checkout "$main_branch" || exit
git merge --no-ff "$stage_branch" -m "Merge $stage_branch into $main_branch" || exit
git push origin "$main_branch" || exit

# If deploying to a production environment, add deployment steps here


git checkout dev
git fetch origin main
git merge origin/main
git push origin dev

git checkout stage
git fetch origin main
git merge origin/main
git push origin stage
git checkout dev
