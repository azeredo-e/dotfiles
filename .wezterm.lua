-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.font_size = 14
config.font = wezterm.font 'JetBrains Mono Bold'
config.window_close_confirmation = 'NeverPrompt'

config.colors = {
    foreground = "#FFFFFF",       -- text color
    background = "#1C1C1C",       -- black background (basic profile)
    cursor_bg = "#FFFFFF",
    cursor_border = "#FFFFFF",
    cursor_fg = "#000000",
    selection_bg = "#75435B",     -- macOS default blue selection (approx)
    selection_fg = "#FFFFFF",

    -- ANSI colors (approximate matches for macOS Terminal 'Basic' with dark bg)
    ansi = {
        "#000000", -- black
        "#C83C3C", -- red
        "#5FAF5F", -- green
        "#C9AA3B", -- yellow / brown
        "#4D88FF", -- blue
        "#A065C9", -- magenta / purple
        "#4DB2B2", -- cyan / teal
        "#BFBFBF", -- bright black (light gray)
    },

    -- Bright ANSI colors
    brights = {
        "#6F6F6F", -- bright black (dark gray)
        "#FF6E6E", -- bright red
        "#8FE28F", -- bright green
        "#FFE07A", -- bright yellow
        "#7FB7FF", -- bright blue
        "#D5A3FF", -- bright magenta
        "#7EEEEE", -- bright cyan
        "#FFFFFF", -- bright white
    },
}

config.keys = {
    {key="w", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=false}}},
}


-- Finally, return the configuration to wezterm:
return config
