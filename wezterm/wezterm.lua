local wezterm = require 'wezterm'

local config = {
    font = wezterm.font 'FantasqueSansM Nerd Font',
    font_size = 19,

    colors = {
        background = "#000000",
        foreground = "#7F7FFF",

        cursor_bg = "#7F7FFF",
        cursor_fg = "#000000",
        cursor_border = "#7F7FFF",

        selection_bg = "#7F7FFF",
        selection_fg = "#000000",
    },

    hide_tab_bar_if_only_one_tab = true,

    default_cursor_style = "SteadyUnderline",

    window_background_opacity = 0.5 
}

return config

