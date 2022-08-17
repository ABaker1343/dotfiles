local awful = require("awful")
local gears = require("gears")

local themeFuncs = {}

function themeFuncs.themeWibar(screen, visible)
    return awful.wibar({
        screen = screen,
        visible = visible,
        position = "top",
        width = screen.geometry.width * 0.99,
        height = screen.geometry.height * 0.027,
        border_width = 4,
        ontop = false,

        shape = function (cr, width, height)
            return gears.shape.partially_rounded_rect(cr,width,height,
            true, true, true, true, 10)
        end
    })
end

return themeFuncs
