#/bin/bash

echo -e "Power-Saver\nBalanced\nPerformance" | fuzzel -d -p ">> " | python3 .config/hypr/scripts/power-profiles.py
