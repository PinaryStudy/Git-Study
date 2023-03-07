#!/usr/bin/env bash

currentBranch=$(git rev-parse --abbrev-ref HEAD)

git reset --hard main
bash start.sh "$currentBranch"