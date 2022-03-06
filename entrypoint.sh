#!/bin/sh

tag=${INPUT_TAG}
message=${INPUT_MESSAGE}

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

current_tag=$(git ls-remote --tags origin | tail -1 | awk -F/ '{print $3}' | awk -F^ '{print $1}')
echo "current_tag: ${current_tag}"

major=$(echo ${current_tag} | cut -d. -f1)
minor=$(echo ${current_tag} | cut -d. -f2)
patch=$(echo ${current_tag} | cut -d. -f3)
echo "major: ${major} minor: ${minor} patch: ${patch}"

echo "message: ${message}"

git show --pretty="" --name-only -n 1

git tag -a "${tag}" -m "${message}"
git push origin "${tag}" || true