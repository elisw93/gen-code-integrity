#!/bin/bash
set -e
set -x

SCRATCH="${GITHUB_ACTION_PATH}/scratch"

GENERATE_CMD="$1"
DIFF_ROOT="$2"

cp -R ${GITHUB_WORKSPACE} ${SCRATCH}
cd ${SCRATCH}

eval "${GENERATE_CMD}"

# error and quit (because of -e) if there is a diff
diff --recursive --new-file --unified=0 {${SCRATCH},${GITHUB_WORKSPACE}}/${DIFF_ROOT} || echo "Generated files are stale. Please run \`${GENERATE_CMD}\` and check in the result." && false

