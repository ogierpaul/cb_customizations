#!/bin/bash

# List of child branches -- shouldn't be here but in git or dynamically generated, but it's fine for poc
child_branches=("standard" "client1" "client2")

# Set the main branch
main_branch="main"

# Iterate through each child branch
for branch in "${child_branches[@]}"; do
    echo "Updating branch $branch with the latest changes from $main_branch..."

    # Checkout the child branch
    git checkout "$branch" || exit

    git pull origin "$branch" || exit

    # Check if the branch is behind the main branch
    commits_behind=$(git rev-list --count "$branch..$main_branch")
    
    # If the branch is behind, pull the latest changes
    if [ "$commits_behind" -gt 0 ]; then
        # Fetch the latest changes from the main branch
        git fetch origin "$main_branch" || exit

        # Merge the changes from the main branch into the child branch
        git merge origin/"$main_branch" || exit

        # Run tests or any other validation steps here
        bash dbt_run/test_dbt_seed_run_test.sh --target "$branch" || exit

        git push origin "$branch" || exit

        # Print a newline for better readability
        echo
    else
        echo "Branch $branch is already up to date with $main_branch."
    fi
done

# Switch back to the original branch
git checkout "$main_branch" || exit

echo "Update complete for specified branches."
