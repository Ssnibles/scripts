#!/bin/bash

echo "Script starting..."

cd ~/.local/share/chezmoi/|| { echo "Failed to change directory"; exit 1; }

chezmoi re-add

git add .

# Commit and push changes
if ! git diff-index --quiet HEAD --; then
  echo "Enter commit message: "
  read -r commit_message  # Read commit message from user input
  git commit -m "$commit_message" || { echo "Git commit failed"; exit 1; }
else
    echo "No changes to commit."
fi

git push || { echo "Git push failed"; exit 1; }

