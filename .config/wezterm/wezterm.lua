local wezterm = require("wezterm")

-- color schemes for light and dark mode
local function color_scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

-- auto swap to light or dark scheme based on OS
wezterm.on("window-config-reloaded", function(window)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local color_scheme = color_scheme_for_appearance(appearance)
	if overrides.color_scheme ~= color_scheme then
		overrides.color_scheme = color_scheme
		window:set_config_overrides(overrides)
	end
end)

local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.font = wezterm.font("SauceCodePro Nerd Font", { weight = "Medium" })
config.font_size = 15

-- if windows start in WSL by default
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.wsl_domains = { { name = "WSL:Ubuntu", distribution = "Ubuntu" } }
	config.default_domain = "WSL:Ubuntu"
end

return config
