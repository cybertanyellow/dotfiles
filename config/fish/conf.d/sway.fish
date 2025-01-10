[ -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" -eq 1 ] && exec sway
