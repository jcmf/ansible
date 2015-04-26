#!/bin/sh
cd "`dirname $0`"
set -ex
node -e 'require("imbroglio").play.compile(require("./game").src, {handleError: function(e) { throw new Error(e); }})'
./node_modules/.bin/gribbl *.jade
