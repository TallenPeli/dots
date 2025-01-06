#bin/bash

echo -e "Power Off\nHibernate\nSleep\nReboot\nLogout" | fuzzel -d -p ">> " | python3 .config/hypr/scripts/power.py
