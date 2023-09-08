local wezterm = require 'wezterm'

local config = {
    font = wezterm.font 'FantasqueSansM Nerd Font',
    font_size = 19,

    use_fancy_tab_bar = false,

    tab_max_width = 64,

    colors = {
        background = "#000000",
        foreground = "#7FFF7F",

        cursor_bg = "#7FFF7F",
        cursor_fg = "#000000",
        cursor_border = "#7FFF7F",

        selection_bg = "#7FFF7F",
        selection_fg = "#000000",

        tab_bar = {

            background = "#000000",
            
            active_tab = {
                bg_color = "7FFF7F",
                fg_color = "000000"
            },
            
            inactive_tab = {
                bg_color = "000000",
                fg_color = "7FFF7F"
            },

            inactive_tab_hover = {
                bg_color = "7FFF7F",
                fg_color = "000000"
            },

            new_tab = {
                bg_color = "000000",
                fg_color = "7FFF7F"
            },

            new_tab_hover = {
                bg_color = "7FFF7F",
                fg_color = "000000"

            }
        }
    },

    hide_tab_bar_if_only_one_tab = true,

    default_cursor_style = "BlinkingUnderline",

    window_background_opacity = 0.3,
    animation_fps = 24
}

return config

