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

# Deploy in UAT
bash ./cicd_scripts/deploy.sh UAT ${UAT_S3_URI}

# Launch function testing
export TEST_TYPE="functional"
export TEST_ENDPOINT=${UAT_ENDPOINT}
npm run front-end-tests

# Deploy in PROD
bash ./cicd_scripts/deploy.sh PROD ${PROD_S3_URI}

# Launch smock test
export TEST_TYPE="smoke"
export TEST_ENDPOINT=${PROD_ENDPOINT}
npm run front-end-tests

