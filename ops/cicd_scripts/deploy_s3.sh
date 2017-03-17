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
#   - bash ./deploy.sh S3_URI
#
# Input Arguments:
# ASSUME_ROLE_ARN ($2): If provided will use the arn to call get a session token for deploying in other aws account.
#                       Current AWS credential should have the right to deploy in the targeted aws account.
#                       If empty string will use current AWS credential for deployment
# S3_URI ($2): (MANDATORY) S3 bucket uri to push build folder


set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING DEPLOY    ============="
echo "=================================================="

echo "== Checking inputs =="
MSG_ARGS="Expecting args: \$1 = ASSUME_ROLE_ARN for deploying in other aws account; \$2 = S3 uri for aws s3 cmd line."

# Setting ENV
if [ -z "${NODE_ENV}" ]
then
    echo "NODE_ENV environment variable is not set. Stopping Script."
    exit 1
fi

ENV=${NODE_ENV}
echo "ENV is set to '$ENV'"

ASSUME_ROLE_ARN=$1
if [ -z "$ASSUME_ROLE_ARN" ]
then
    echo "No Assume Role. Aws Env Credential default setting will be used."
else

    echo "Assume Role is set: $ASSUME_ROLE_ARN"
    echo "Will request new credential assume role credential using env credential setting."
    CREDENTIAL=$(aws sts assume-role --role-arn "$ASSUME_ROLE_ARN" --role-session-name "Travis-CICD-Update-$ENV")
    ARN_AWS_ACCESS_KEY_ID=$(echo $CREDENTIAL | jq -r '.Credentials.AccessKeyId')
    ARN_AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIAL | jq -r '.Credentials.SecretAccessKey')
    ARN_AWS_SESSION_TOKEN=$(echo $CREDENTIAL | jq -r '.Credentials.SessionToken')

    # Save current token
    BACKUP_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
    BACKUP_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

    echo "== Setting new aws assume role credential == "
    export AWS_ACCESS_KEY_ID=$ARN_AWS_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY=$ARN_AWS_SECRET_ACCESS_KEY
    export AWS_SESSION_TOKEN=$ARN_AWS_SESSION_TOKEN
fi

# Setting S3 uri
S3_URI=$2
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

if [ -z "$ASSUME_ROLE_ARN" ]
then
    echo "Done."
else
    echo "== Reverting aws credential to original value == "
    export AWS_ACCESS_KEY_ID=$BACKUP_AWS_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY=$BACKUP_AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
fi
