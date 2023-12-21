#!/bin/bash

folder_path="~/.vnc"

if [[ -d "$folder_path" ]]; then
    
    # Perform actions related to an existing folder here
    apt update ;  apt install -y xfce4 xfce4-goodies dbus-x11 tightvncserver novnc nmap;
    mkdir ~/.vnc;
    echo "#!/bin/bash
    xrdb $HOME/.Xresources
    startxfce4 &" > ~/.vnc/xstartup ;
    chmod +x ~/.vnc/xstartup;
    echo "123456" | vncpasswd -f ;
    # Perform actions for when the folder does not exist
else
    echo "Already Installed.";
fi

echo "passwd is 123456";
vncpasswd -f <<< "123456" && vncserver -rfbport 8002 ; nmap -p- localhost;

file_path="/usr/share/novnc/utils/novnc_proxy"

if [ -e "$file_path" ]; then
    /usr/share/novnc/utils/novnc_proxy --vnc localhost:8002 --listen 8000
else
    /usr/share/novnc/utils/launch.sh --vnc localhost:8002 --listen 8000
fi
