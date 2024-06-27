#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y && pkg i iproute2 android-tools -y

adb connect $(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1):5555
adb shell

# you should be in an adb shell env and the shell prompt should have changed to your device's codename
# you can execute the commands here as 'wm user-rotation lock|free 0|1' 
# OR
# ctrl +d in the adb shell env, and once back in termux shell env use adb shell wm user-rotation locl|free 0|1
