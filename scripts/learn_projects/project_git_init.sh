#!/bin/bash

echo
echo "bash script:  $0"
echo "performing github init steps for project:  $*"


PROJECT_FOLDER=$1
PROJECT_NAME=$(basename "$PROJECT_FOLDER")
echo "PROJECT_FOLDER: $PROJECT_FOLDER"
echo "PROJECT_NAME: $PROJECT_NAME"

cd "$PROJECT_FOLDER"
git init "$PROJECT_FOLDER"

cd "$PROJECT_FOLDER"

# Set up README.me as first commit
echo -e "# $PROJECT_FOLDER" > README.md
git add README.md
git commit -m "first commit - set up README.md"

# create main branch
git branch -M main

# create repo on github, private by default, you can always change on github later
gh repo create "$PROJECT_NAME" --private

# push the first commit to github
# and show that the remote was created successfully

 # origin_url should be like: https://github.com/jtam2000/learn_terraform.git
origin_url=`gh api user --jq '.html_url'`/$PROJECT_NAME.git
echo "origin_url: $origin_url"
git remote add origin "$origin_url"
git push --set-upstream origin main

git remote -v
git log -1
echo -e "\n\n You are at branch:"
git branch