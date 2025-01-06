# This script is part of 'tallen_peli/dots'

import os
import sys
import time

for line in sys.stdin:
    if "Power Off" in line:
        os.system("notify-send 'System' 'System shutting down now...'")
        time.sleep(1)
        os.system("shutdown -h now")
        exit(1)
    elif "Hibernate" in line:
        os.system("notify-send 'System' 'Hibernating now...'")
        os.system("hyprctl dispatch exec hyprlock")
        time.sleep(1)
        os.system("systemctl hibernate")
        exit(2)
    elif "Sleep" in line:
        os.system("hyprctl dispatch exec hyprlock")
        time.sleep(1)
        os.system("systemctl sleep")
        exit(3)
    elif "Reboot" in line:
        os.system("notify-send 'System' 'System rebooting now...'")
        time.sleep(1)
        os.system("reboot")
        exit(4)
    elif "Logout" in line:
        os.system("notify-send 'System' 'Logging out now...'")
        time.sleep(1)
        os.system("hyprctl dispatch exit")
        exit(5)
    else:
        os.system("notify-send 'System' 'Something went wrong.'")
        exit(6)
