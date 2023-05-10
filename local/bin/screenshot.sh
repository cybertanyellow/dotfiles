#!/bin/sh

#grim -g "$(slurp)" | wl-copy
grim -g "$(slurp)" ~/Pictures/$(date +'%s_grim.png')
