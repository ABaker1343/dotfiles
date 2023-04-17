local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local themeFuncs = {}

function themeFuncs.themeWibar(screen, visible)
    return awful.wibar({
        screen = screen,
        visible = visible,
        position = "top",
        width = screen.geometry.width,
        height = screen.geometry.height * 0.027,
        border_width = 0,
        ontop = false,

        shape = function (cr, width, height)
            return gears.shape.rectangle(cr,width,height)
        end
    })
end

function themeFuncs.setupWibar(w, widgets, theme)
    

    w:setup {
        layout = wibox.layout.flex.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.taglist,
            {
                layout = wibox.container.place,
                halign = "right",
                widgets.tasklist,
            }
        },
        {
            layout = wibox.container.place,
            widgets.clock_widget,
            --mycalendar,
            --wibox.widget.calendar.month(os.date('*t')),
            halign = "center",
        },
        {
            layout = wibox.layout.flex.horizontal,
            widgets.battery_widget,
            widgets.volume_widget,
            {
                layout = wibox.container.place,
                halign = "right",
                wibox.widget.systray(),
            },
        }
    }

end

function themeFuncs.startCompositor()
    awful.spawn.with_shell("picom")
end

return themeFuncs
