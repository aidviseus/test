#!/usr/bin/env bash
set -euo pipefail

REMOTE_URL=${1:-}
BRANCH_NAME=${2:-main}
REMOTE_NAME=origin

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: publish.sh must be run from inside a Git repository." >&2
  exit 1
fi

if git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  CURRENT_URL=$(git remote get-url "$REMOTE_NAME")
  if [[ -n "$REMOTE_URL" && "$REMOTE_URL" != "$CURRENT_URL" ]]; then
    echo "Updating remote '$REMOTE_NAME' -> $REMOTE_URL"
    git remote set-url "$REMOTE_NAME" "$REMOTE_URL"
  else
    echo "Using existing remote '$REMOTE_NAME' -> $CURRENT_URL"
  fi
else
  if [[ -z "$REMOTE_URL" ]]; then
    echo "Usage: $0 <remote-url> [branch]" >&2
    echo "Error: provide a remote URL the first time you run publish.sh." >&2
    exit 1
  fi
  echo "Adding remote '$REMOTE_NAME' -> $REMOTE_URL"
  git remote add "$REMOTE_NAME" "$REMOTE_URL"
fi

if git rev-parse --verify "$REMOTE_NAME/$BRANCH_NAME" >/dev/null 2>&1; then
  echo "Pushing updates for branch '$BRANCH_NAME'..."
  git push "$REMOTE_NAME" "$BRANCH_NAME"
else
  echo "Pushing branch '$BRANCH_NAME' and setting upstream..."
  git push -u "$REMOTE_NAME" "$BRANCH_NAME"
fi
