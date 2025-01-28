-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Ayu Dark (Gogh)'
config.font = wezterm.font_with_fallback {
  'Fira Code',
  'MesloLGS NF',
}
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.80
config.window_padding = {
  top = 0,
  right = 0,
  left = 0,
  bottom = 0,
}
config.max_fps = 240
config.default_prog = {"/home/nico/.cargo/bin/zellij"}
config.keys = {
    -- Añadir atajos de teclado si lo necesitas
    {key="C", mods="CTRL", action=wezterm.action{CopyTo="Clipboard"}},
}

config.mouse_bindings = {
  {
    event = {Up = {streak = 1, button = "Right"}},
    mods = "NONE",
    action = wezterm.action{PasteFrom = "PrimarySelection"}
  }
}
config.font_size = 16
config.enable_tab_bar = true
return config
