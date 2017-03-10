#!/bin/bash

# Deploy to S3 by:
# - 'npm run build' to generate the 'build' folder
# - Empty bucket, before push 'build folder to s3, EXCEPT if NODE_ENV set to 'production' value.
#   Emptying bucket is to make sure testing will be launch on successful file push and not previous file push.
#   If 'production', will not empty bucket to avoid longer downtime.
# - Deploy with aws s3 sync of 'build' folder, with --delete options to delete inexisting file.
#
# Environment variables are expecting to be set to run :
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
# NODE_ENV
#
#
# Script Usage:
#   - bash ./deploy.sh ENV S3_URI
#
# Input Arguments:
# S3_URI ($1): (MANDATORY) S3 bucket uri to push build folder


set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING DEPLOY    ============="
echo "=================================================="

echo "== Checking inputs =="
MSG_ARGS="Expecting args: \$1 = ENV for deployment, \$2 = S3 uri for aws s3 cmd line."

# Setting ENV
if [ -z "${NODE_ENV}" ]
then
    echo "NODE_ENV environment variable is not set. Stopping Script."
    exit 1
fi

ENV=${NODE_ENV}
echo "ENV is set to '$ENV'"

# Setting S3 uri
S3_URI=$1
if [ -z "$S3_URI" ]
then
    echo "S3 uri arg is unset. Stopping script."
    echo "$MSG_ARGS"
    exit 1
else
    echo "S3 uri is set to '$S3_URI'"
fi

# re-build folder to deploy
echo "== Running 'npm run build' =="
npm run build

# EMPTY BUCKET if needed
EMPTY_BUCKET=true
if [ "$ENV" == "production" ]; then EMPTY_BUCKET=false; fi
echo "EMPTY_BUCKET is set to $EMPTY_BUCKET"

if $EMPTY_BUCKET
then
    echo "== Starting empty bucket $S3_URI =="
    aws s3 rm $S3_URI --recursive
fi

echo "== deploying to $S3_URI =="
aws s3 sync build $S3_URI --delete
