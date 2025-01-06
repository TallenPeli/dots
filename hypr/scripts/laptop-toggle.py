import subprocess

# This script basically checks if other monitors are connected and if so, disable the laptop screen when the lid is closed. If the laptop screen is the only monitor, then just lock the screen.

with open('/proc/acpi/button/lid/LID0/state', 'r') as lid_file:
    lid_state = lid_file.read().strip()

if 'open' in lid_state:
    subprocess.run(['hyprctl', 'keyword', 'monitor', 'eDP-1, 2256x1504@60, 0x1440, 1.333'])

    # Kill hyprpaper and restart it
    subprocess.run(['pkill', 'hyprpaper'])
    subprocess.run(['hyprctl', 'dispatch', 'exec', 'hyprpaper'])

    # Kill waybar and restart it
    subprocess.run(['killall', 'waybar'])
    subprocess.run(['hyprctl', 'dispatch', 'exec', 'waybar'])
else:
    monitor_count = subprocess.run(['hyprctl', 'monitors'], capture_output=True, text=True)
    if monitor_count.stdout.count('Monitor') != 1:
        # Default option is to just ignore the sleep command if there are more than 1 monitors.
        pass
        # This sometimes crashes systems. Test before using.
        # subprocess.run(['hyprctl', 'keyword', 'monitor', 'eDP-1, disable'])
    else:
        subprocess.run(['hyprlock'])

