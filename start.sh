#!/usr/bin/env bash

currentBranch=$(git rev-parse --abbrev-ref HEAD)

validateTaskBranch() {
    if [ $(git branch -r | grep -w -c $1) == 0 ]
    then
        echo "$(tput setaf 1)"아직 준비되지 않은 내용입니다."$(tput sgr0)"
        
        exit 1
    fi
}

initCurrentBranch() {
    if [ "$currentBranch" != "main" ]
    then
        echo "$(tput setaf 3)"현재 main branch에 있지 않습니다. main branch 로 이동하여 작업을 수행합니다."$(tput sgr0)"
        git checkout main
    fi
}

initCurrentBranch
validateTaskBranch taskBranch
if [ $(git branch | grep -w -c $1) == 0 ]
then
    git branch "$1"
fi
git checkout "$1"
git pull origin "$1"
bash task.sh