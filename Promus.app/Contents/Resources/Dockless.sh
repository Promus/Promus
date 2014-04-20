#!/bin/sh

recurses(){ printf "Self-referential:\n\t$argv ->\n\t$argv\n" ;}
dangling(){ printf "Broken symlink:\n\t$argv ->\n\t"$(readlink "$argv")"\n" ;}
errnoent(){ printf "No such file: "$@"\n" ;} # Borrow a horrible signal name.

pathfull(){ cd "$(dirname "$@")"; link="$(readlink "$(basename "$@")")"

 if [ ! -e "$@" ]; then if $(ls -d "$@" 2>/dev/null) 2>/dev/null;  then
    errnoent 1>&2; exit 1; elif [ ! -e "$@" -a "$link" = "$@" ];   then
    recurses 1>&2; exit 1; elif [ ! -e "$@" ] && [ ! -z "$link" ]; then
    dangling 1>&2; exit 1; fi
 fi

 if [ -z "$link" ]; then if [ "$(dirname "$@" | cut -c1)" = '/' ]; then
   printf "$@\n"; exit 0; else printf "$(pwd)/$(basename "$@")\n"; fi; exit 0
 fi

 while [ "$link" ]; do
   cd "$(dirname "$link")"; newlink="$(readlink "$(basename "$link")")"
   case "$newlink" in
    "$link") dangling 1>&2 && exit 1                                       ;;
         '') printf "$(pwd)/$(basename "$link")\n"; exit 0                 ;;
          *) link="$newlink" && pathfull "$link"                           ;;
   esac
 done
 printf "$(pwd)/$(basename "$newlink")\n"
}

if [ -z "$argv" ]; then scriptname="$(pathfull "$0")"
 scriptpath=`echo $scriptname | sed 's/Dockless.sh/\//g'`
 cd $scriptpath
 cd ..
 pwd
 cat Info.plist
 # cat Info.plist | sed 's/<\/dict>/<key>Application is agent \(UIElement\)<\/key><string>1<\/string><\/dict>/g' > Info.plist;
else pathfull "$@"
 scriptpath=`echo "$@" | sed 's/Dockless.sh/\//g'`
 cd $scriptpath
 cd ..
 pwd
 cat Info.plist
 # | sed 's/<\/dict>/<key>Application is agent \(UIElement\)<\/key><string>1<\/string><\/dict>/g' > Info.plist;
fi;