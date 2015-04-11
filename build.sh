#!/bin/sh
cd "`dirname $0`"
set -ex
node -e 'require("imbroglio").play.compile(require("./game").src)'
./node_modules/.bin/gribbl *.jade
