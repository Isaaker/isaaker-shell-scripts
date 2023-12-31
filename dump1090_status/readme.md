# Dump1090 Status

**You need to have JQuery installed**

Install with: ```sudo apt install jq```

** RUN AS SUDO **

## About

The program checks if the aircraft tracking files exist, otherwise they have been deleted by dump1090-fa when the execution was aborted due to an error.

If the file exists, it is checked if it contains any aircraft in tracking in its .aircrafts attribute and if not, it is interpreted as dump1090-fa is not reading the data correctly and proceeds to restart it and the feeders in case any of them crashes during the restart of dump1090.

## Compatiblity

I use dump1090-fa

The script is adapted to my services and dump version, you can customize it to better adapt it to your needs.

## Log

A log file is saved in: /var/log/dump1090_restart_log.txt
