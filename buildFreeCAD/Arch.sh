#!/bin/bash
(( BASH_VERSINFO[0] < 4 )) && echo "Bash 4+ required." && exit 1
# Build FreeCAD docker container
cd $FreeCAD
git switch mybranch
cd project-source/tools/build/Arch
touch xauth_list
xauth list | sed '2,2d' | sed "s/:/$DISPLAY/" > xauth_list
docker-compose build
rm xauth_list
