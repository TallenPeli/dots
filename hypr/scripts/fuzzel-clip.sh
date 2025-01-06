#!/bin/sh

cliphist list | fuzzel -d -p '>> ' | cliphist decode | wl-copy
