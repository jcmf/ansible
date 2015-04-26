#!/bin/sh
[ -n "$*" ] || set patch
set -ex
cd "`dirname $0`"
test -z "`git status --porcelain 2>&1`"
./build.sh
test -z "`git status --porcelain 2>&1`"
npm version --git-tag-version=false "$@"
./build.sh
version="v`node -e 'console.log(JSON.parse(require("fs").readFileSync("package.json", "utf8")).version)'`"
cp index.html "old/ansible-v$version.html"
git add .
git commit -m "$version"
git tag -am "$version" "$version"
# git push
# npm publish
ssh toastball.net 'cat > tmp && test -s tmp && mv tmp www/toastball.net/games/ansible/index.html' < index.html
