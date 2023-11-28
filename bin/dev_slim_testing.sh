!/bin/bash
dev_branch="dev"

# Get the root directory of the Git repository
repo_root=$(git rev-parse --show-toplevel)

# Change to the root directory
cd "$repo_root" || exit

# Ensure we are on the dev branch
git checkout "$dev_branch" || exit

# Change to the root directory
cd dbt

# Run tests or any other validation steps here
bash dbt build --select state --target "$dev_branch" || exit