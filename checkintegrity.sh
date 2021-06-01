#!/bin/bash
set -e
set -x

SCRATCH="${GITHUB_ACTION_PATH}/scratch"

GENERATE_CMD="$1"
DIFF_ROOT="$2"

cp -R ${GITHUB_WORKSPACE} ${SCRATCH}
cd ${SCRATCH}

eval "${GENERATE_CMD}"
diff --recursive --new-file --unified=0 {${SCRATCH},${GITHUB_WORKSPACE}}/${DIFF_ROOT}
STATUS=$?

if [[ $? -eq 0 ]]; then
    exit 1
fi

exit 0

