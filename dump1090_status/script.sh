#!/bin/bash
# Created by: Isaaker
# Font Code: https://github.com/Isaaker/isaaker-shell-scripts/new/main/dump1090_status
# License: https://github.com/Isaaker/isaaker-shell-scripts/blob/main/LICENSE.txt
# RUN AS SUDO

# Check services running
# Check Dump1090
if [systemctl is-active dump1090-fa.service -ne "active"]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running, restarting services. Checked by: Method 1 - Systemctl"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running. Checked by: Method 1 - Systemctl" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart dump1090-fa.service
systemctl restart rbfeeder.service
systemctl restart fr24feed.service
systemctl restart piaware.service
systemctl restart adsbexchange-feed.service

exit 1
fi

# Check Radarbox Feeder

if [systemctl is-active rbfeeder.service -ne "active"]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Radarbox Feeder stopped running, restarting service. Checked by: Method 1 - Systemctl"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running. Checked by: Method 1 - Systemctl" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart rbfeeder.service

fi

# Check FlightRadar24 Feeder

if [systemctl is-active fr24feed.service -ne "active"]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] FlightRadar24 Feeder stopped running, restarting service. Checked by: Method 1 - Systemctl"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] FlightRadar24 stopped running. Checked by: Method 1 - Systemctl" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart fr24feed.service

fi

# Check Piaware Feeder

if [systemctl is-active piaware.service -ne "active"]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] PiAware Feeder stopped running, restarting service. Checked by: Method 1 - Systemctl"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] PiAware stopped running. Checked by: Method 1 - Systemctl" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart piaware.service

fi

# Check ADS-B Exchange Feeder

if [systemctl is-active adsbexchange-feed.service -ne "active"]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] ADS-B Exchange Feeder stopped running, restarting service. Checked by: Method 1 - Systemctl"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] ADS-B Exchange stopped running. Checked by: Method 1 - Systemctl" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart adsbexchange-feed.service

fi

# Check aircraft file exist
if [ ! -f /run/dump1090-fa/aircraft.json ]; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running, restarting services. Checked by: Method 2 - /run/dump1090-fa/aircraft.json file didn't exist"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running. Checked by: Method 2 - /run/dump1090-fa/aircraft.json file didn't exist" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart dump1090-fa.service
systemctl restart rbfeeder.service
systemctl restart fr24feed.service
systemctl restart piaware.service
systemctl restart adsbexchange-feed.service

exit 1
fi

# Check .aircraft contains current tracked aircrafts
if jq '.aircraft | length > 0' /run/dump1090-fa/aircraft.json; then
#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 still running" >> /var/log/dump1090_restart_log.txt

exit 0

else

#Wall
wall "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running, restarting services"

#Log
sudo echo "[$(date +"%d-%m-%Y %H:%M:%S")] Dump1090 stopped running" >> /var/log/dump1090_restart_log.txt

#Restarting Services
systemctl restart dump1090-fa.service
systemctl restart rbfeeder.service
systemctl restart fr24feed.service
systemctl restart piaware.service
systemctl restart adsbexchange-feed.service

exit 1
fi
