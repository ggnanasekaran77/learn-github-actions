#!/bin/sh

tag=${INPUT_TAG}
message=${INPUT_MESSAGE}

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git fetch --tags
git fetch --prune --unshallow || true

git ls-remote --tags origin

git tag -a "${tag}" -m "${message}"
git push origin "${tag}" || true