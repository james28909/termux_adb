First and foremost, this repo is pretty much just an example how to use adb directly in termux and also shows how host your own repo for and running scripts in termux directly from that repo and also shows different ways to execute them, depending on your env.

***Please let me know if anything isnt working as expected***

***You can put one command in a shell script on your device.
```
#!/data/data/com.termux/files/usr/bin/ bash

#this is for unrooted phone, and will skip pkg update and upgrade and will not install deps.

bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/pkg update -y//g' | sed 's/okg upgrade -y//g' | sed 's/pkg i iproute2 android-tools -y//g')
```
save this in a .sh file in termux shortcuts directory. create a new 
termux widget and link it to the shell script. Now you have a shortcut 
to flip the rotation on yoru home screen!***

---------------------------------------------------------------------------

termux_adb.sh is just a script that allows you to use adb on the device itself instead of on a pc

PLEASE NOTE THAT YOU MUST CONNECT YOUR DEVICE TO YOUR PC AND RUN ```adb tcpip 5555``` THEN DISCONNECT THE USB CABLE FROM THE DEVICE.

once you do that:

run this script in termux as is for adb shell commands:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh)```

you can also run this script with root privleges as well from termux by using
this command in termux instead of the one above:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/adb -s $ip:5555 shell/su -c/g' | sed 's/adb connect $ip:5555//g')```

if youre using rooted samsung, try this command in termux:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/adb -s $ip:5555 shell/su -c/g' | sed 's/user-rotation/set-user-rotation/g' | sed 's/adb connect $ip:5555//g')```

if youre on an unrooted samsung try this to use adb commands in termux:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/user-rotation/set-user-rotation/g')```

if you want to only flip to landscape on rooted samsung, search for the portrait command and delete it:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/sleep 3//g' | sed 's/echo.*adb -s $ip:5555 shell wm user-rotation lock 0.*PORTRAIT"//g' | sed 's/adb -s $ip:5555 shell wm user-rotation lock 0//g' | sed 's/adb -s $ip:5555 shell/su -c/g' | sed 's/user-rotation/set-user-rotation/g')```

if you want to flip back to portrait on rooted samsung:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/sleep 3//g' | sed 's/echo.*adb -s $ip:5555 shell wm user-rotation lock 1.*LANDSCAPE"//g' | sed 's/adb -s $ip:5555 shell wm user-rotation lock 1//g' | sed 's/adb -s $ip:5555 shell/su -c/g' | sed 's/user-rotation/set-user-rotation/g')```

if you want to skip pkg update and pkg upgrade and deps:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/pkg update -y//g' | sed 's/okg upgrade -y//g' | sed 's/pkg i iproute2 android-tools -y//g') ```

if you want to skip pkg update and pkg upgrade and deps on rooted samsung:
```bash <(curl -s https://raw.githubusercontent.com/james28909/termux_adb/main/termux_adb.sh | sed 's/adb -s $ip:5555 shell/su -c/g' | sed 's/pkg update -y//g' | sed 's/pkg upgrade -y//g' | sed 's/pkg i iproute2 android-tools -y//g' | sed 's/user-rotation/set-user-rotation/g' | sed 's/adb connect $ip:5555//g')```
