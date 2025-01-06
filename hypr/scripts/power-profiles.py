import sys
import os

for line in sys.stdin:
    if "Power-Saver" in line:
        os.system("powerprofilesctl set power-saver")
        os.system("notify-send 'System' 'Performance set to \'Power-Saver\''")
        exit(1)
    elif "Balanced" in line:
        os.system("powerprofilesctl set balanced")
        os.system("notify-send 'System' 'Performance set to \'Balanced\''")
        exit(2)
    elif "Performance" in line:
        os.system("powerprofilesctl set performance")
        os.system("notify-send 'System' 'Performance set to \'Performance\''")
        exit(3)
    else:
        os.system("notify-send 'System' 'Something went wrong. Expected [Power-Saver, Balanced, Performance]'")
        exit(4)
