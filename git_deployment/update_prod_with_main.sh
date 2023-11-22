#!/bin/bash

# List of branches to update
branches=("standard" "client1" "client2")

# Set the main branch
main_branch="main"

# Iterate through each branch
for branch in "${branches[@]}"; do
    echo "Updating branch $branch with the latest changes from $main_branch..."
    
    # Checkout the branch
    git checkout "$branch" || exit
    
    # Pull the latest changes from the main branch
    git pull origin "$main_branch" || exit
    
    # Push the changes to the remote branch
    git push origin "$branch" || exit

    # Print a newline for better readability
    echo
done

# Switch back to the original branch
git checkout - || exit

echo "Update complete for specified branches."
