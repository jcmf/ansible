#!/bin/sh
set -ex
test -n "$*"
cd "`dirname $0`"
test -z "`git status --porcelain 2>&1`"
./build.sh
test -z "`git status --porcelain 2>&1`"
npm version --git-tag-version=false "$@"
version="v`node -e 'console.log(JSON.parse(require("fs").readFileSync("package.json", "utf8")).version)'`"
git commit -am "$version"
git tag -am "$version" "$version"
git push
ssh toastball.net 'cat > tmp && test -s tmp && mv tmp www/toastball.net/ansible/index.html' < index.html
