#!/data/data/com.termux/files/usr/bin/bash

#update termux env and add some dependencies that we need
pkg update -y
pkg upgrade -y
pkg i iproute2 android-tools -y

#get ip address
ip=$(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)


adb connect $ip:5555
#adb -s $ip:5555 shell
echo " run 'adb -s $ip:5555 shell wm user-rotation lock 1' for LANDSCAPE"
adb -s $ip:5555 shell wm user-rotation lock 1

sleep 3

echo " run 'adb -s $ip:5555 shell wm user-rotation lock 0' for PORTRAIT"
adb -s $ip:5555 shell wm user-rotation lock 0

# you should be in an adb shell env and the shell prompt should have changed to your device's codename
# you can execute the commands here as 'wm user-rotation lock|free 0|1' 
# OR
# ctrl +d in the adb shell env, and once back in termux shell env use adb shell wm user-rotation locl|free 0|1
