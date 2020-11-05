#!/bin/bash

# English text

export WSLKIT_L1="WSLKit, The user friendly WSL toolkit!"
export WSLKIT_L2="Made by sc39 so KK64 can use linux on his PC."
export WSLKIT_L3="You need root privileges. Run this script as root using the sudo command."

# Check to see if we are root

if [ "$EUID" -ne 0 ]
then 
	echo ${WSLKIT_L3}
	exit
fi

echo ${WSLKIT_L1}
echo ${WSLKIT_L2}

# Install Desktop Enviorment

apt update
apt install git
function InstallX11() {
	apt update
	apt install xterm x11-apps
	echo `
	export DISPLAY=:0.0` >> ~/.bashrc
}
function InstallMWMAndTWM() {
	apt update
	InstallX11
	apt install mwm twm
}
InstallX11
InstallMWMAndTWM

# Install other apps/tools

apt install build-essential autoconf automake mesa-utils crispy-doom emacs xemacs21 wget curl

# Generate wrappers

mkdir /wslkit
echo "
#!/bin/bash
twm &
xterm &
" > /wslkit/start-twm
echo "
#!/bin/bash
mwm &
xterm &
" > /wslkit/start-mwm
echo "
#!/bin/bash
kill $(pidof twm)
kill $(pidof xterm)
" > /wslkit/stop-twm
echo "
#!/bin/bash
kill $(pidof mwm)
kill $(pidof xterm)
" > /wslkit/stop-mwm
chmod +x /wslkit/start-twm
chmod +x /wslkit/start-mwm
chmod +x /wslkit/stop-twm
chmod +x /wslkit/stop-mwm
echo "
export PATH=$PATH:/wslkit" >> ~/.bashrc
source ~/.bashrc
echo "Installed! You can now use the following commands:"
echo "start-twm"
echo "start-mwm"
echo "stop-twm"
echo "stop-mwm"
