-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

--local power = require("power_widget")

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
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- read the current them
local theme = "default"
local cThemePath = string.format("%s/.config/awesome/themes/currentTheme", os.getenv("HOME"))

local themeFile = io.open(cThemePath)
if themeFile then
    theme = themeFile:read("*a")
    themeFile:close()
    theme = theme:sub(1, -2) -- remove the newline
    gears.debug.print_warning(theme)
    gears.debug.print_warning("theme found")
else
    gears.debug.print_warning("couldnt read current theme file")
end

local themepath = string.format("%s/.config/awesome/themes/%s/", os.getenv("HOME"), theme)

beautiful.init(themepath .. "theme.lua")
local themeFuncs = dofile(themepath .. "imports.lua")

-- This is used later as the default terminal and editor to run.
-- terminal = "st"
-- terminal = "kitty --single-instance -c ~/.config/kitty/kitty.conf -c ~/.config/kitty/colors.conf"
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
local compositorActive = false

--power.warning_config = {
    --percentage = 15,
    --message = "Low battery",
    --preset = {
        --shape = gears.shape.rounded_rect,
        --bg = "#a0a0a0",
        --fg = "fffffff",
    --},
--}

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4" -- super key

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.floating,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Calendar widget
local mymonthcalendar = awful.widget.calendar_popup.month()
 --attach to the clock and position top center
mymonthcalendar:attach(mytextclock, "tc")

-- battery widget
local battery_widget = require("battery-widget") {
    adapter = "BAT0",
    battery_prefix = {
        {25, "[#---]"},
        {50, "[##--]"},
        {75, "[###-]"},
        {100, "[####]"},
    }
}

-- volume widget
local volume_widget, volume_timer = awful.widget.watch('sh -c "pactl get-sink-volume @DEFAULT_SINK@ | awk \'{print $5}\'"', 60*5)


function is_terminal(c)
    return (c.class and c.class:match(terminal)) and true or false
end

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    --local isBarVisible
    if s.index == 1 then s.isBarVisible = true
    else s.isBarVisible = false
    end

    -- if theme is laptop then we dont need a battery widget
    if theme ~= "laptop" then
        battery_widget = wibox.widget {
            markup = "",
            widget = wibox.widget.textbox,
        }
    end

    -- Create the wibox
    s.mywibox = themeFuncs.themeWibar(s, s.isBarVisible)

    -- Add widgets to the wibar
    s.mywibox:setup {
        layout = wibox.layout.flex.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            {
                layout = wibox.container.place,
                halign = "right",
                s.mytasklist,
            }
        },
        {
            layout = wibox.container.place,
            mytextclock,
            --mycalendar,
            --wibox.widget.calendar.month(os.date('*t')),
            halign = "center",
        },
        {
            layout = wibox.layout.flex.horizontal,
            battery_widget,
            volume_widget,
            {
                layout = wibox.container.place,
                halign = "right",
                wibox.widget.systray(),
            },
        }
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    --awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              --{description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn.with_shell(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift", "Control"  }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    --awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              --{description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    --awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              --{description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey }, "r", function () awful.util.spawn("dmenu_run") end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- custom hotkeys

    -- scratch terminal
    awful.key({modkey}, "Return", function()
        --local s = awful.screen.focused()
        awful.util.spawn("st -c scratch")
    end,
    {description = "spawn a scratch terminal"}),

    awful.key({ modkey, "Shift"}, "b", function() awful.util.spawn("firefox") end,
    {description = "spawn a browser (firefox)"}),
    awful.key({ modkey, "Shift"}, "s", function() awful.util.spawn("spotify") end,
    {description = "spawn spotify"}),
    awful.key({ modkey, "Shift"}, "d", function() awful.util.spawn("discord") end,
    {description = "spawn discord"}),
    awful.key({ modkey, "Shift"}, "g", function() awful.util.spawn("steam") end,
    {description = "spawn steam"}),
    awful.key({ modkey, "Shift"}, "p", function() awful.util.spawn("firefox --private") end,
    {description = "spawn private browser (firefox)"}),
    awful.key({modkey , "Shift"}, "f", function() awful.util.spawn("pcmanfm") end,
    {description = "spawn a gui file manager"}),
    awful.key({modkey, "Shift"}, "m", function() awful.util.spawn("thunderbird") end,
    {description = "spawn an email client"}),

    awful.key({ modkey, "Shift"}, "r", function() awful.spawn.with_shell(terminal .. " -e ranger") end,
    {description = "spawn a terminal instance running ranger"}),
    awful.key({ modkey, "Shift"}, "h", function() awful.spawn.with_shell(terminal .. " -e htop") end,
    {description = "spawn a terminal instance running htop"}),

    awful.key({ modkey, "Shift"}, "a", function() awful.util.spawn("sh /bin/soundSelect.sh") end,
    {desription = "spawn dmenu for selecting audio output"}),

    awful.key({}, "Print", function() awful.util.spawn("flameshot gui") end,
    {description = "spawn flameshot for taking screenshots"}),

    -- media control keys

    awful.key({ modkey}, "F7", function() awful.util.spawn("playerctl -p spotify next") end,
    {description = "next spotify track"}),
    awful.key({ modkey}, "F6", function() awful.util.spawn("playerctl -p spotify play-pause") end,
    {descrption = "spotify play/pause"}),
    awful.key({ modkey}, "F5", function() awful.util.spawn("playerctl -p spotify previous") end,
    {description = "previous spotify track"}),

    awful.key({modkey}, "F2", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -10%")
        volume_timer:emit_signal("timeout")
    end,
    {description = "Lower system volume by 10%"}),
    awful.key({modkey}, "F3", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%")
        volume_timer:emit_signal("timeout")
    end,
    {description = "Raise system volume by 10%"}),

    awful.key({modkey}, "F10", function() awful.util.spawn("transset-df -a 0.8") end,
    {description = "add transparency to current window"}),
    awful.key({modkey}, "F9", function() awful.util.spawn("transset-df -a 1") end,
    {description = "remove transparency from current window"}),

    awful.key({modkey}, "b", function() local myscreen = awful.screen.focused()
        myscreen.mywibox.visible = not myscreen.mywibox.visible
    end,
    {description = "toggle bar visibility"}),


    -- layout keys

    awful.key({modkey}, "t", function()
        if awful.layout.get(awful.screen.focused()) == awful.layout.suit.tile then
            awful.layout.set(awful.layout.suit.tile.bottom)
        else
            awful.layout.set(awful.layout.suit.tile)
        end
    end,
    {description = "toggle tile right and tile bottom"}),

    awful.key({modkey}, "s", function() awful.layout.set(awful.layout.suit.max) end,
    {description = "set layout max"}),

    awful.key({modkey}, "y", function() awful.layout.set(awful.layout.suit.floating) end,
    {description = "set layout floating"}),

    -- theme keys
    awful.key({modkey, "Control"}, "l", function()
        awful.util.spawn("/bin/layoutSelect.sh")
    end,
    {description = "change the current theme"}),

    -- gaps keys
    awful.key({modkey, "Control"}, "Page_Up", function()
        if beautiful.useless_gap < 80 then
            local tag = awful.screen.focused().selected_tag
            tag.gap = tag.gap + 4
            --beautiful.useless_gap = beautiful.useless_gap + 4
            awful.layout.arrange(awful.screen.focused())
        end
    end,
    {description = "increase window gaps"}),
    awful.key({modkey, "Control"}, "Page_Down", function()
        if beautiful.useless_gap >= 0 then
            --beautiful.useless_gap = beautiful.useless_gap - 4
            local tag = awful.screen.focused().selected_tag
            tag.gap = tag.gap - 4
            awful.layout.arrange(awful.screen.focused())
        end
    end,
    {description = "decrease window gaps"}),

    -- enable/disable compositor
    awful.key({modkey, "Control"}, "c", function()
        if not compositorActive then
            themeFuncs.startCompositor()
        else
            awful.spawn.with_shell("killall picom")
        end
        compositorActive = not compositorActive
    end,
    {description = "kill/restore the compositor"}),


    -- screen recorder hotkeys
    awful.key({modkey}, "F12", function() awful.spawn.with_shell("killall -SIGUSR1 gpu-screen-recorder") end,
    {description = "save a replay video using screen recorder"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"}),

        -- brightness keys
        awful.key({modkey, "Control"}, "F4", function() awful.spawn.with_shell("brightnessctl -c backlight s +10%") end,
        {description = "lower brightness by 10%"}),
        awful.key({modkey, "Control"}, "F5", function() awful.spawn.with_shell("brightnessctl -c backlight s 10%-") end,
        {description = "increase brightness by 10%"}),

        awful.key({modkey, "Control", "Shift"}, "F4", function() awful.spawn.with_shell("brightnessctl -d *kbd_backlight s +50%") end,
        {description = "lower brightness by 10%"}),
        awful.key({modkey, "Control", "Shift"}, "F5", function() awful.spawn.with_shell("brightnessctl -d *kbd_backlight s 50%-") end,
        {description = "increase brightness by 10%"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    -- { rule_any = {type = { "normal", "dialog" }
      -- }, properties = { titlebars_enabled = true }
    -- },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },

    -- Stop using st size hints
    rule = {
        {class = "st-256color"},
        properties = {size_hints_honor = false}
    },
    {
        -- make scratch windows float in the middle of the screen
        rule = { class = "scratch" },
        properties = {
            floating = true,
            x = awful.screen.focused().geometry.width * 0.25 + awful.screen.focused().geometry.x,
            y = awful.screen.focused().geometry.height * 0.25  + awful.screen.focused().geometry.y,
            width = awful.screen.focused().geometry.width * 0.5,
            height = awful.screen.focused().geometry.height * 0.5,
        }
    },
    {
        -- make steam open on tag 3
        rule_any = {
            class = {"Steam"},
            instance = {"Steam"},
            name = {"Steam"}
        },
        properties = {
            tag = ""
        }
    },
    {
        rule = {class = "steam_app.*"},
        properties = {
            tag = "",
            fullscreen = true,
        }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
client.connect_signal("manage", function(c)
    if is_terminal(c) then
        return
    end
    local parent_client = awful.client.focus.history.get(c.screen, 1)
    if parent_client and is_terminal(parent_client) then
        parent_client:map(1)
    end
end
)
-- }}}-

-- set the starting layouts
-- set the initial layout to tile
awful.layout.set(awful.layout.suit.tile)
awful.tag.incmwfact(0.05)
-- set screen 1 tag 3 to max layout (this screen is used for steam and games)
awful.tag.find_by_name(awful.screen[1], "").layout = awful.layout.suit.max

-- launch the compositor
themeFuncs.startCompositor()
compositorActive = true