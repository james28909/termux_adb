#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y && pkg i iproute2 android-tools -y

adb connect $(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1):5555
adb shell
