# Dump1090 Status
## About

This program checks if dump1090 is running correctly by checking if there is still output of the decoded data, this can be seen in /run/dump1090-fa/aircraft.json and if aircarfts is empty we will know that dump1090 is not generating output.

This is achieved through jQuery by checking the string named aircraft within the aircraft file being tracked.

## Compatiblity

I use dump1090-fa

The script is adapted to my services and dump version, you can customize it to better adapt it to your needs.

## Log

A log file is saved in: /var/log/dump1090_restart_log.txt
