#!/bin/sh

# run in subshell to avoid polluting cwd
(

set -e

# remove the build folder if it does exist
if [ -d build ]; then
   rm -rf ./build
fi

./node_modules/.bin/tsc --version

# Transpiling all TypeScript files in project
# If we allow dead code elimination with TypeScript, we will end up with a nasty looking bundle
# and extra bytes.
# Rollup will use tree-shaking and fix this for us

TSCONFIG=./tsconfig.json

echo "> compiling..."
 ./node_modules/.bin/tsc  \
        --outDir ./build \
        -t es6 \
        --skipLibCheck \
        -p ${TSCONFIG}
)
