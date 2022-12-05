local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local themeFuncs = {}

function themeFuncs.themeWibar(screen, visible)
    return awful.wibar({
        screen = screen,
        visible = visible,
        position = "right",
        width = screen.geometry.width * 0.015,
        height = screen.geometry.height,
        border_width = 0,
        ontop = false,

        shape = function (cr, width, height)
            return gears.shape.rectangle(cr,width,height)
        end
    })
end

function themeFuncs.setupWibar(w, widgets, theme)
    w:setup {
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            {
                layout = wibox.container.rotate,
                direction = "west",
                widgets.taglist,
            },
            {
                layout = wibox.container.rotate,
                direction = "west",
                halign = "right",
                widgets.tasklist,
            }
        },
        {
            layout = wibox.container.rotate,
            direction = "west",
            widgets.clock_widget,
            --mycalendar,
            --wibox.widget.calendar.month(os.date('*t')),
            halign = "center",
        },
        {
            layout = wibox.layout.flex.vertical,
            {
                layout = wibox.container.rotate,
                direction = "west",
                widgets.battery_widget,
                widgets.volume_widget,
            },
            {
                layout = wibox.container.rotate,
                direction = "west",
                halign = "right",
                wibox.widget.systray(),
            },
        }
    }
end

--[[
function themeFuncs.themeWibar(screen, visible)
    return nil
end

function themeFuncs.setupWibar(w, widgets, theme)
    awful.spawn.with_shell("polybar")
end
]]--

function themeFuncs.startCompositor()
    local handle = io.popen("pidof picom")
    if not handle then return end
    local result = handle:read("*a")
    handle:close()
    if not result == "\n" then
        awful.spawn.with_shell("killall picom && picom --config ~/.config/picom/picomdefault.conf")
    else
        awful.spawn.with_shell("picom --config ~/.config/picom/picomdefault.conf")
    end
end

return themeFuncs
