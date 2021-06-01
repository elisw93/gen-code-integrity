#!/bin/bash
set -e
set -x

# scratch directory for generating files
SCRATCH="${GITHUB_ACTION_PATH}/scratch"

# parse script arguments
GENERATE_CMD="$1"
DIFF_ROOT="$2"

# copy working-tree from checkout to scratch directory
cp -R ${GITHUB_WORKSPACE} ${SCRATCH}
cd ${SCRATCH}

# run the generate command
eval "${GENERATE_CMD}"

# error and quit if there is a diff
diff --recursive --new-file --unified=0 {${SCRATCH},${GITHUB_WORKSPACE}}/${DIFF_ROOT} || ( echo "Generated files are stale. Please run \`${GENERATE_CMD}\` and check in the result." && exit 1 )

