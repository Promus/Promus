#!/bin/sh

scriptpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $scriptpath
cd ..
# sed 's/<\/dict>/<key>LSUIElement<\/key><true\/><\/dict>/g' Info.plist > Info.plist;
/usr/libexec/plistbuddy -c "Add :LSUIElement bool 1" Info.plist