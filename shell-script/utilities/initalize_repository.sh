#! /bin/bash

echo "Enter the git remote url: "
read GIT_REMOTE_URL

git init

git add . 

git commit -m "inital commit"

git remote add origin "$GIT_REMOTE_URL"

git push -u origin master

echo "Git Remote Repo intialization sucess!" 