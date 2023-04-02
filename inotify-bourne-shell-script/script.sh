#!/bin/sh
while true
do
        #Inotify Trigger
        inotifywait -r --exclude "(swp|swx)"  -e modify,create,attrib,close_write,move,delete /home/pi/Lab1/monitor
        #Script before Inotify
        sudo rm -r /var/www/monitor
        sudo cp -r /home/pi/Lab1/monitor /var/www
done
