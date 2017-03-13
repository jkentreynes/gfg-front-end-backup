#!/bin/bash

# Merging change from current branch to another branch.
# IMPORTANT: Changes are forced
#
# Script Usage:
#   - bash ./merge.sh MERGE_FROM_BRANCH MERGE_TO_BRANCH
# Ex: bash ./merge.sh v0.1.0 master
#
# Below Environment variable are expecting to be set :
# GH_TOKEN: Github personnal token with right to pull, push in the repo


MERGE_TO_BRANCH=$1

echo "== Checking inputs =="
MSG_ARGS="Expecting args: \$1 = MERGE_TO_BRANCH."

if [ -z "$MERGE_TO_BRANCH" ]
then
    echo " MERGE_TO_BRANCH is unset. Stopping script."
    echo "$MSG_ARGS"
    exit 1
else
    echo "MERGE_TO_BRANCH is set to '$MERGE_TO_BRANCH'"
fi

##TODO check if can work without modifying global credentials
echo "== Setting GIT credentials =="
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"

# Get current branch
TMP_MERGE_FROM_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch: $TMP_MERGE_FROM_BRANCH"

echo "== Merging $TMP_MERGE_FROM_BRANCH to $MERGE_TO_BRANCH =="
# Merge branch, force change from MERGE_FROM_BRANCH (for automatic conflict solving from npm-shrinkwrap for example)
git remote set-branches --add origin $MERGE_TO_BRANCH
git fetch
git checkout -b $MERGE_TO_BRANCH origin/$MERGE_TO_BRANCH
git git merge $TMP_MERGE_FROM_BRANCH -X theirs -m "[Travis] Merging from branch $TMP_MERGE_FROM_BRANCH"
git push origin $MERGE_TO_BRANCH

