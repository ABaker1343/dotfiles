local awful = require("awful")
local gears = require("gears")

local themeFuncs = {}

function themeFuncs.themeWibar(screen, visible)
    return awful.wibar({
        screen = screen,
        visible = visible,
        position = "top",
        width = screen.geometry.width,
        height = screen.geometry.height * 0.035,
        border_width = 0,
        ontop = false,

        shape = function (cr, width, height)
            return gears.shape.rectangle(cr,width,height)
        end
    })
end

function themeFuncs.startCompositor()
    awful.spawn.with_shell("killall picom")
end

return themeFuncs
