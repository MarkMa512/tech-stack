#!/bin/bash

# This script is used to initialize a repository and push the first commit to the main branch.
# Copy this script to the root of the repository and run it.
# The GIT_REMOTE_URL parameter is required to be passed to the script.
# Example: ./init_repo.sh "https://github.com/username/example.git"
# Note: This script is not idempotent. It will fail if the repository is already initialized.
# Note: This script will add initialise_repo.sh to .gitignore so it is not pushed to the remote repository.

# Check if the GIT_REMOTE_URL parameter is provided
if [ -z "$1" ]; then
  echo "Error: GIT_REMOTE_URL parameter is missing."
  exit 1
fi

# Initialize the repository
git init

# Add init_repo.sh to .gitignore so it is not pushed to the remote repository
echo "init_repo.sh" >> .gitignore

# Add all changes
git add .

# Make the initial commit
git commit -m "initial commit"

# Add remote origin
GIT_REMOTE_URL=$1
git remote add origin "$GIT_REMOTE_URL"

# Push to the main branch
git push -u origin main

echo "Repository initialized and first commit pushed."