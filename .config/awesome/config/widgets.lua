mykeyboardlayout = awful.widget.keyboardlayout()

mytextclock = wibox.widget.textclock()

mymonthcalendar = awful.widget.calendar_popup.month()
mymonthcalendar:attach(mytextclock, "tc")

battery_widget = nil
local battery_file = io.open("/sys/class/power_supply/BAT0/type", "r")
if battery_file ~= nil then
    battery_widget = require("battery-widget") {
        adapter = "BAT0",
        battery_prefix = {
            {25, "[#---]"},
            {50, "[##--]"},
            {75, "[###-]"},
            {100, "[####]"},
        }
    }
end

volume_widget, volume_timer = awful.widget.watch('sh -c "pactl get-sink-volume @DEFAULT_SINK@ | awk \'{print $5}\'"', 60*5)

memWidget = awful.widget.watch('bash -c "free -h | awk \'/^Mem/ {print $3}\'"' ,1)


-- task and taglist

taglist_buttons = gears.table.join(
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

tasklist_buttons = gears.table.join(
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
