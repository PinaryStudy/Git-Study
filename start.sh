#!/usr/bin/env bash

currentBranch=$(git rev-parse --abbrev-ref HEAD)

validateTaskBranch() {
    if [ $(git branch -r | grep -w $1) -eq 0 ]
    then
        echo 아직 준비되지 않은 내용입니다.
        exit 1
    fi
}

initCurrentBranch() {
    if [ "$currentBranch" != "main" ]
    then
        echo "현재 main brnach에 있지 않습니다. main brnach 로 이동합니다."
        git checkout main
    fi
}

initCurrentBranch
validateTaskBranch taskBranch
