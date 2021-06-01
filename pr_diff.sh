#!/bin/bash
set -e
set -x

REPO_HEAD="/github/workspace"
SCRATCH="/scratch"

GENERATE_CMD="$1"
DIFF_ROOT="$2"

cp --archive ${REPO_HEAD} ${SCRATCH}
cd ${SCRATCH}

`${GENERATE_CMD}`
diff --recursive --new-file --unified=0 {${WORKSPACE},${REPO_HEAD}}/${DIFF_ROOT}
STATUS=$?

if [[ $? -eq 0 ]]; then
    exit 1
fi

exit 0

