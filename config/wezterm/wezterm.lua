local wezterm = require 'wezterm'
local config = {}

config.font_size = 9.0
config.enable_tab_bar = false
config.enable_wayland = true
--config.window_background_image = '/home/yellow/Pictures/spacex.jpg'

if os.date("*t").hour >= 12 then
	-- print("It is afternoon.")
	config.color_scheme = 'Catppuccin Mocha'
	config.font = wezterm.font 'Fira Code Nerd Font Mono'
else
	-- print("It is not afternoon.")
	config.color_scheme = 'Catppuccin Latte (Gogh)'
	config.font = wezterm.font 'JetBrains Mono'
end
config.font = wezterm.font 'JetBrains Mono'

return config
