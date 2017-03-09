#!/bin/bash

# s3 sync of build folder, with delete of inexisting file
# Travis Environment variable are expecting to be set for aws to run :
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING DEPLOY    ============="
echo "=================================================="

echo "== Checking argument =="
S3_URI=$1

if [ -z "$S3_URI" ]
then
    echo "S3 uri is unset"
    exit 1
else
    echo "S3 uri is set to '$S3_URI'"
fi

#TODO copy/set config file

echo "== deploying to $S3_URI =="
aws s3 sync build $S3_URI --delete
