#!/bin/sh
files=$(git diff --cached --name-only --diff-filter=ACM | grep ".js$")
if [ "$files" = "" ]; then
    echo "No JS files committed to parse with ESLint."
    echo "\033[37;42mCOMMIT SUCCEEDED\033[0m\n"
    exit 0
fi
pass=true
echo "\nValidating JavaScript:\n"
for file in ${files}; do

    result=$(node_modules/eslint/bin/eslint.js ${file})
    if $(echo ${result} | grep -q '0 errors') || [ "$result" == "" ]; then
        echo "\t\033[37;42mESLint Passed: ${file}\033[0m\n"
    else
        echo "\t\033[37;41mESLint Failed: ${file}\033[0m"
        echo "\t\033[31m$result\033[0m\n"

        echo "\t\033[31m===============================================\033[0m\n"
        echo "\t\033[31mTrying to solve automatically issue by launching cmd : eslint.js --fix ${file}\033[0m"
        echo "\t\033[31mFor automatic fix, you should git add this file again and do a new commit\033[0m"
        echo "\t\033[31mIf issue persist you need to solve it manually. Refer to http://eslint.org/docs/rules/ for more info.\033[0m\n"
        echo "\t\033[31m===============================================\033[0m\n"
        echo $(node_modules/eslint/bin/eslint.js --fix ${file})
        pass=false
    fi
done
echo "\nJavaScript validation complete\n"
if ! $pass; then
    echo "\033[37;41mCOMMIT FAILED:\033[0m Your commit contains files that should pass ESLint but do not. Please fix the ESLint errors and try again.\n"
    exit 1
else
    echo "\033[37;42mCOMMIT SUCCEEDED\033[0m\n"
fi
