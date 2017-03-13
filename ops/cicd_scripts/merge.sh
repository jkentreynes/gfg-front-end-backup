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

#TODO check if can work without modifying global credentials
echo "== Setting GIT credentials =="
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"

echo "== Create new branch from current branch =="
TMP_MERGE_FROM_BRANCH="merge-Travis-$BUILD_ID"
git checkout -b "$TMP_MERGE_FROM_BRANCH"

echo "== Merging $MERGE_TO_BRANCH to $MERGE_TO_BRANCH =="
# Merge branch, force change from MERGE_FROM_BRANCH (for solving conflict from npm-shrinkwrap)
git checkout $MERGE_TO_BRANCH
git git merge $TMP_MERGE_FROM_BRANCH -X theirs
git push origin $MERGE_TO_BRANCH

