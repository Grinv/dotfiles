local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 18.0
config.window_decorations = "RESIZE"
config.color_scheme = "kanagawabones"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Kimber (base16)"
config.background = {
	{
		source = {
			File = "/Users/konstantin/Desktop/Lala_Deviluke_Anime.png",
			-- File = "/Users/konstantin/Downloads/Studio Ghibli Nature Wallpaper.jpg",
		},
		height = "Cover",
		width = "Cover",
		-- height = "Contain",
		-- width = "Contain",
		repeat_y = "NoRepeat",
		repeat_x = "NoRepeat",
		horizontal_align = "Center",
	},
}

-- config.window_frame.inactive_titlebar_bg = "#1b1032"

-- config.window_background_image = '/Users/konstantin/Downloads/Studio Ghibli Nature Wallpaper.jpg'
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
