import sys
import os
from pathlib import Path
homedir = str(Path.home())
WSLKIT_L1 = "WSLKit, The user friendly WSL toolkit!"
WSLKIT_L2 = "Made by sc39 so KK64 can use linux on his PC."
WSLKIT_L3 = """Installation complete! Now you can use the following commands:
start-twm
start-mwm
stop-twm
stop-mwm
"""
WSLKIT_S1 = """
twm &
xterm &
"""
WSLKIT_S2 = """
mwm &
xterm &
"""
WSLKIT_S3 = """
kill $(pidof twm)
kill $(pidof xterm)
"""
WSLKIT_S4 = """
kill $(pidof mwm)
kill $(pidof xterm)
"""
print(WSLKIT_L1)
print(WSLKIT_L2)
os.system("apt install git xterm x11-apps mwm twm build-essential autoconf automake mesa-utils crispy-doom emacs xemacs21 wget curl")
os.system("apt update")
bashrc = open(homedir + "/.bashrc", "a")
bashrc.write("\nexport DISPLAY=:0.0\nexport PATH=$PATH:/wslkit")
bashrc.close()
try:
	os.mkdir("/wslkit")
except:
	pass
starttwm = open("/wslkit/start-twm", "w")
starttwm.write(WSLKIT_S1)
starttwm.close()
startmwm = open("/wslkit/start-twm", "w")
startmwm.write(WSLKIT_S1)
startmwm.close()
stoptwm = open("/wslkit/start-twm", "w")
stoptwm.write(WSLKIT_S1)
stoptwm.close()
stopmwm = open("/wslkit/start-twm", "w")
stopmwm.write(WSLKIT_S1)
stopmwm.close()
print(WSLKIT_L3)
