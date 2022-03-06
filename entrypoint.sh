#!/bin/sh -l

echo "Hello $1 $2"
echo "secret: ${input_github_token}"
echo "test: ${test}"
time=$(date)
echo "::set-output name=time::$time"
cd /workdir
pwd
find .
echo "git tag list $(git tag | tee -a)"