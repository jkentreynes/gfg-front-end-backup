#!/bin/bash

set -e # Exit with nonzero exit code if anything fails
echo "=================================================="
echo "=============     STARTING CI/CD     ============="
echo "=================================================="

# Build a tag
bash ./cicd_scripts/build.sh

# deploy in UAT
bash ./cicd_scripts/deploy.sh

# Launch integration/e@e2 testing
npm run functional-tests

# deploy in PROD
# TODO


