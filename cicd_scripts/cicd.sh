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
bash ./cicd_scripts/build.sh

# deploy in UAT
bash ./cicd_scripts/deploy.sh ${UAT_S3_URI}

# Launch function testing
npm run functional-tests

# deploy in PROD
bash ./cicd_scripts/deploy.sh ${PROD_S3_URI}

# TODO launch smock test

