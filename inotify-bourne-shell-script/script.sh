#!/bin/sh
while true
do
        #Inotify Trigger
        inotifywait -r --exclude "(swp|swx)"  -e modify,create,attrib,close_write,move,delete /your/custom/path
        #Script before Inotify
        sudo rm -r /your/custom/path
        sudo cp -r /your/custom/path /your/custom/path
done
