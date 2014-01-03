#!/bin/sh

scriptpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $scriptpath
cd ..
# sed 's/<\/dict>/<key>LSUIElement<\/key><true\/><\/dict>/g' Info.plist > Info.plist;
/usr/libexec/plistbuddy -c "Delete :LSUIElement" Info.plist