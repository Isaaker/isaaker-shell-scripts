# Inotify Bourne Shell Trigger

## About the Script

## Download the Script

[Download Script](https://github.com/13942346-5be9-4d7e-acb0-1fa57dab1f1d)

## Setup the script

### Installation

1. Download the script using the button in the download the script section
2. Custom the filepaths of the script to works with your paths
                                              
### Background

**To run the Trigger for ever in background (This script does not overload the server since the script waits for a response from inotifywait. The only thing that the while True does is that the script does not terminate so that it can be used with nohup.)**


``nohup bash script.sh 2>&1 &``


**Kill the Trigger (When is on background, to kill it out of background use ^c)**

Find the Trigger Process ID with:

``ps -ef |grep script.sh``

<img width="542" alt="What is the Process ID" src="https://user-images.githubusercontent.com/77550577/188910552-0d4d3b2d-d65c-441c-b53a-0e12090e6df5.png">


And Kill it with (Replace ID with the Trigger ID):

``kill ID``


## Font code and LICENSE

This script is created by Isaaker

See the font code at: https://github.com/Isaaker/isaaker-shell-scripts

See the license at: https://github.com/Isaaker/isaaker-shell-scripts/blob/main/LICENSE.txt
