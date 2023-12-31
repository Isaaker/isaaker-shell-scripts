#!/bin/bash
# Created by: Isaaker
# Font Code: https://github.com/Isaaker/isaaker-shell-scripts/new/main/dump1090_status
# License: https://github.com/Isaaker/isaaker-shell-scripts/blob/main/LICENSE.txt

if jq '.aircraft | length > 0' /run/dump1090-fa/aircraft.json; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running" > /var/log/dump1090_restart_log.txt

else

#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running, restarting services"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running" > /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart dump1090-fa.service
systemctl restart rbfeeder.service
systemctl restart fr24feed.service
systemctl restart piaware.service

fi
