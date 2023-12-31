#!/bin/bash
#Created by: Isaaker
#Font code: https://github.com/Isaaker/isaaker-shell-scripts/tree/main
#License: CC BY-NC-ND 4.0

if pgrep “dump1090” > /dev/null
then

#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running" -s "Dump1090 Service"

#Log
echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running" > /home/radar/dump1090_restart_log.txt

else

#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running, restarting services" -s "Dump1090 Service"

#Log
echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running" > /home/radar/dump1090_restart_log.txt

#Restarting Services
systemctl restart dump1090-fa.service
systemctl restart rbfeeder.service
systemctl restart fr24feeder.service
systemctl restart piaware.service

fi
