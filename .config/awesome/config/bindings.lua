
-- mouse bindings

root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

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
    awful.key({ modkey }, "r", function () awful.util.spawn("rofi -show run") end, --("dmenu_run") end,
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
    {description = "spawn a scratch terminal", group="spawning"}),

    -- applications

    awful.key({ modkey, "Shift"}, "b", function() awful.util.spawn("firefox") end,
    {description = "spawn a browser (firefox)", group="spawning"}),
    awful.key({ modkey, "Shift"}, "s", function() awful.util.spawn("flatpak run com.spotify.Client") end,
    {description = "spawn spotify", group="spawning"}),
    awful.key({ modkey, "Shift"}, "d", function() awful.util.spawn("flatpak run com.discordapp.Discord") end,
    {description = "spawn discord", group="spawning"}),
    awful.key({ modkey, "Shift"}, "g", function() awful.spawn.with_shell("gamemoderun steam") end,
    {description = "spawn steam with gamemode", group="spawning"}),
    awful.key({modkey, "Control"}, "g", function() awful.spawn.with_shell("lutris") end,
    {description = "spawn lutris", group="spawning"}),
    awful.key({ modkey, "Shift"}, "p", function() awful.util.spawn("firefox --private") end,
    {description = "spawn private browser (firefox)", group="spawning"}),
    awful.key({modkey , "Shift"}, "f", function() awful.util.spawn("pcmanfm") end,
    {description = "spawn a gui file manager", group="spawning"}),
    awful.key({modkey, "Shift"}, "m", function() awful.util.spawn("thunderbird") end,
    {description = "spawn an email client", group="spawning"}),

    awful.key({ modkey, "Shift"}, "r", function() awful.spawn.with_shell(terminal .. " -e ranger") end,
    {description = "spawn a terminal instance running ranger", group="spawning"}),
    awful.key({ modkey, "Shift"}, "h", function() awful.spawn.with_shell(terminal .. " -e htop") end,
    {description = "spawn a terminal instance running htop", group="spawning"}),

    awful.key({ modkey, "Shift"}, "a", function() awful.util.spawn("sh /bin/soundSelect.sh") end,
    {desription = "spawn dmenu for selecting audio output", group="spawning"}),

    awful.key({}, "Print", function() awful.util.spawn("flameshot gui") end,
    {description = "spawn flameshot for taking screenshots", group="spawning"}),

    -- media control keys

    awful.key({ modkey}, "F7", function() awful.util.spawn("playerctl -p spotify next") end,
    {description = "next spotify track", group="media"}),
    awful.key({ modkey}, "F6", function() awful.util.spawn("playerctl -p spotify play-pause") end,
    {descrption = "spotify play/pause", group="media"}),
    awful.key({ modkey}, "F5", function() awful.util.spawn("playerctl -p spotify previous") end,
    {description = "previous spotify track", group="media"}),

    awful.key({modkey}, "F2", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -10%")
        volume_timer:emit_signal("timeout")
    end,
    {description = "Lower system volume by 10%", group="media"}),
    awful.key({modkey}, "F3", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%")
        volume_timer:emit_signal("timeout")
    end,
    {description = "Raise system volume by 10%", group="media"}),

    awful.key({modkey, "Control"}, "v", function() awful.util.spawn("copyq menu") end,
    {description = "spawn clipboard manager menu"}),

    awful.key({modkey}, "F10", function() awful.util.spawn("transset-df -a 0.8") end,
    {description = "add transparency to current window", group="compositor"}),
    awful.key({modkey}, "F9", function() awful.util.spawn("transset-df -a 1") end,
    {description = "remove transparency from current window", group="compositor"}),

    awful.key({modkey}, "b", function() local myscreen = awful.screen.focused()
        myscreen.mywibox.visible = not myscreen.mywibox.visible
    end,
    {description = "toggle bar visibility", group="awesome"}),


    -- layout keys

    awful.key({modkey}, "t", function()
        if awful.layout.get(awful.screen.focused()) == awful.layout.suit.tile then
            awful.layout.set(awful.layout.suit.tile.bottom)
        else
            awful.layout.set(awful.layout.suit.tile)
        end
    end,
    {description = "toggle tile right and tile bottom", group="layout"}),

    awful.key({modkey}, "s", function() awful.layout.set(awful.layout.suit.max) end,
    {description = "set layout max", group="layout"}),

    awful.key({modkey}, "y", function() awful.layout.set(awful.layout.suit.floating) end,
    {description = "set layout floating", group="layout"}),

    -- theme keys
    awful.key({modkey, "Control"}, "l", function()
        awful.util.spawn("/bin/layoutSelect.sh")
    end,
    {description = "change the current theme", group="layout"}),

    -- gaps keys
    awful.key({modkey, "Control"}, "Page_Up", function()
        if beautiful.useless_gap < 80 then
            local tag = awful.screen.focused().selected_tag
            tag.gap = tag.gap + 4
            --beautiful.useless_gap = beautiful.useless_gap + 4
            awful.layout.arrange(awful.screen.focused())
        end
    end,
    {description = "increase window gaps", group="layout"}),
    awful.key({modkey, "Control"}, "Page_Down", function()
        if beautiful.useless_gap >= 0 then
            --beautiful.useless_gap = beautiful.useless_gap - 4
            local tag = awful.screen.focused().selected_tag
            tag.gap = tag.gap - 4
            awful.layout.arrange(awful.screen.focused())
        end
    end,
    {description = "decrease window gaps", group="layout"}),

    -- enable/disable compositor
    awful.key({modkey, "Control"}, "c", function()
        if not compositorActive then
            themeFuncs.startCompositor()
        else
            awful.spawn.with_shell("killall picom")
        end
        compositorActive = not compositorActive
    end,
    {description = "kill/restore the compositor", group="compositor"}),


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
        awful.key({modkey, "Control"}, "F4", function() awful.spawn.with_shell("brightnessctl -c backlight s 10%-") end,
        {description = "lower brightness by 10%", group="brightness"}),
        awful.key({modkey, "Control"}, "F5", function() awful.spawn.with_shell("brightnessctl -c backlight s +10%") end,
        {description = "increase brightness by 10%", group="brightness"}),

        awful.key({modkey, "Control", "Shift"}, "F4", function() awful.spawn.with_shell("brightnessctl -d *kbd_backlight s 50%-") end,
        {description = "lower brightness by 10%", group="brightness"}),
        awful.key({modkey, "Control", "Shift"}, "F5", function() awful.spawn.with_shell("brightnessctl -d *kbd_backlight s +50%") end,
        {description = "increase brightness by 10%", group="brightness"})
)

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

root.keys(globalkeys)

