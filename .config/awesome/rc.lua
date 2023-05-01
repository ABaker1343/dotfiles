-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
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

function is_terminal(c)
    return (c.class and c.class:match(terminal)) and true or false
end

local compositorActive = false

-- read the current them
require('config.theme')
require('config.vars')
require('config.layouts')
require('config.menu')
require('config.widgets')
require('config.setupScreen')
require('config.bindings')
require('config.rules')
require('config.signals')


-- set the initial layout to tile
awful.layout.set(awful.layout.suit.tile)
awful.tag.incmwfact(0.05)
-- set screen 1 tag 3 to max layout (this screen is used for steam and games)
awful.tag.find_by_name(awful.screen[1], "").layout = awful.layout.suit.max

-- launch the compositor
themeFuncs.startCompositor()
compositorActive = true
