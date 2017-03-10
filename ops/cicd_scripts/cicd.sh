#!/bin/bash

# Launch th CI / CD pipeline :
# - Build new release tag with CHANGELOG, npm-shrinkwrap and version bumping
# - Commit CHANGELOG and version bumping (package.json version) in 'develop'
# - Deploy to UAT
# - Launch functional test
# - Deploy to PROD
# - Launch smoke

set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING CI/CD     ============="
echo "=================================================="

# Build a tag
bash ./ops/cicd_scripts/build.sh

#################
# Deploy in UAT
#################
export NODE_ENV="uat"
bash ./ops/cicd_scripts/deploy.sh ${UAT_S3_URI}

# Launch function testing
echo "== Starting functional test =="
export TEST_TYPE="functional"
export TEST_ENDPOINT=${UAT_ENDPOINT}
npm run front-end-tests


##################
## Deploy in PROD
##################
#export NODE_ENV="production"
#bash ./ops/cicd_scripts/deploy.sh ${PROD_S3_URI}
#
## Launch smoke test
#echo "== Starting smoke test =="
#export TEST_TYPE="smoke"
#export TEST_ENDPOINT=${PROD_ENDPOINT}
#npm run front-end-tests

