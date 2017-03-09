#!/bin/bash

# S3 sync of 'build' folder, with --delete options to delete inexisting file
# Travis Environment variable are expecting to be set for aws to run :
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
#
# Script Usage:
#   - bash ./deploy.sh ENV S3_URI
#
# Input Arguments:
# ENV ($1): (MANDATORY) Env name to deploy. Ex: uat or prod. Usage:
#           - Empty bucket, before push 'build folder to s3, EXCEPT if set to 'PROD' value.
#             Useful to make sure testing will be launch on successful file push and not previous file push.
#             If 'PROD', will not empty bucket to avoid longer downtime.
#           - TODO copy config file according to env
# S3_URI ($2): (MANDATORY) S3 bucket uri to push build folder


set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING DEPLOY    ============="
echo "=================================================="

echo "== Checking script arguments =="

ENV=$1
if [ -z "$ENV" ]
then
    echo "ENV is unset"
    exit 1
else
    echo "ENV is set to '$ENV'"
fi

S3_URI=$2
if [ -z "$S3_URI" ]
then
    echo "S3 uri is unset"
    exit 1
else
    echo "S3 uri is set to '$S3_URI'"
fi

# EMPTY BUCKET if needed
EMPTY_BUCKET=true
if [ "$ENV" == "PROD" ]; then EMPTY_BUCKET=false; fi
echo "EMPTY_BUCKET is set to $EMPTY_BUCKET"

if $EMPTY_BUCKET
then
    echo "== Starting empty bucket $S3_URI =="
#    aws s3 rm $S3_URI --recursive
fi

#TODO copy/set config file according to ENV



echo "== deploying to $S3_URI =="
#aws s3 sync build $S3_URI --delete
