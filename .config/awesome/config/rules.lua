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
