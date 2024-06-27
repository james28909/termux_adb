#!/data/data/com.termux/files/usr/bin/bash

#update termux env and add some dependencies that we need
pkg update -y
pkg upgrade -y
pkg i iproute2 android-tools -y

#get ip address
ip=$(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)

#connect and demonstrate the rotaion command
adb connect $ip:5555

echo " run 'adb -s $ip:5555 shell wm user-rotation lock 1' for LANDSCAPE"
adb -s $ip:5555 shell wm user-rotation lock 1
sleep 3
echo " run 'adb -s $ip:5555 shell wm user-rotation lock 0' for PORTRAIT"
adb -s $ip:5555 shell wm user-rotation lock 0
