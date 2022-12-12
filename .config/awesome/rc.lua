pcall(require, "luarocks.loader")

local naughty = require("naughty")
local beautiful = require("beautiful")


-- Config error checking
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end


-- Load theme
beautiful.init("~/.config/awesome/theme.lua")


terminal = "st -e fish"
editor = "nvim"
editor_cmd = "st -e nvim"
browser = "firefox"
cmdmenu = "rofi -show drun -show-icons"

modkey = "Mod4"

require("conf.autostart") 
require("conf.keys")    -- keybinds
require("conf.wm")      -- window management
require("conf.signals") -- signals
require("conf.ui")      -- user interface
